module Api
  module V1
    class CodesController < BaseApiController
      respond_to :json
      before_action :ensure_code_found!, only: [:show]
      skip_before_action :validate_json, only: [:index, :show]

      # GET /codes.json
      def index
        @codes = Code.all
      end

      # GET /codes/1.json
      def show
        return success(@code)
      end

      # POST /codes.json
      def create
        begin
          @code = Code.create!(code_params)
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

        # Never trust parameters from the scary internet, only allow the white list through.
        def code_params
          params.require(:code).permit(:text, :is_private)
        end
    end
  end
end

