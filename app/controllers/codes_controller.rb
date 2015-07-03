class CodesController < ApplicationController
  before_action :set_code, only: [:show]
  before_action :set_secret_code, only: [:secret_show]

  # GET /codes
  # GET /codes.json
  def index
    @codes = Code.public_codes
  end

  # GET /codes/1
  # GET /codes/1.json
  def show
  end

  # GET /codes/secret_show/12345
  # GET /codes/secret_show/12345.json
  def secret_show
     redirect_to codes_path, notice: 'No Code Found.' if @code.blank?
  end

  # GET /codes/new
  def new
    @code = Code.new
  end

  # POST /codes
  # POST /codes.json
  def create
    token = code_params.fetch(:is_private) == '1' ?  SecureRandom.hex(32) : nil
    @code = Code.new(code_params.merge!({token: token}))
    respond_to do |format|
      if @code.save
        unless @code.token.blank?
          format.html { redirect_to codes_path, notice: "Please save this secret url to access this code in future: #{request.host_with_port}/codes/#{@code.id}/#{@code.token}" }
        else
          format.html { redirect_to codes_path, notice: "Code created successfully" }
        end
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code
      @code = Code.find(params[:id])
    end

    def set_secret_code
      @code = Code.find_by id: params[:id], token: params[:token]
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def code_params
      params.require(:code).permit(:text, :is_private)
    end
end
