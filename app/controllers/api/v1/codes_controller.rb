module Api
  module V1
    class CodesController < BaseApiController
      respond_to :json
      before_action :ensure_code_found!, only: [:show]
      before_action :ensure_secret_code_found!, only: [:secret_show]
      skip_before_action :validate_json, only: [:index, :show, :secret_show]

      # GET /codes.json
      def index
        @codes = Code.public_codes
      end

      # GET /codes/1.json
      def show
        return success(@code)
      end

      # GET /codes/1.json
      def secret_show
        return success(@code)
      end

      # POST /codes.json
      def create
        token = code_params.fetch(:is_private) == 'true' ?  SecureRandom.hex(32) : nil
        begin
          @code = Code.create!(code_params.merge!({token: token}))
          return success(@code)
        rescue *RecoverableExceptions => e
          return error(E_INTERNAL, e.message)
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def ensure_code_found!
          @code = Code.find(params[:id])
          return error(E_RESOURCE_NOT_FOUND, "Resource Couldn't be found") if @code.blank?
        end

        def ensure_secret_code_found!
          @code = Code.find_by id: params[:id], token: params[:token]
          return error(E_RESOURCE_NOT_FOUND, "Resource Couldn't be found") if @code.blank?
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def code_params
          params.require(:code).permit(:text, :is_private)
        end
    end
  end
end

