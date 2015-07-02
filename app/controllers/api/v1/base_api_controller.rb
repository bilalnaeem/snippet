module Api
  module V1
    RecoverableExceptions = [
      ActiveRecord::RecordNotUnique,
      ActiveRecord::RecordInvalid,
      ActiveRecord::RecordNotSaved
    ]

    class Api::V1::BaseApiController < ActionController::Base
      # rescue_from Exception do |e|
      #   Rails.logger.error e.message
      #   error(E_API, e.message)
      # end

      respond_to :json
      before_action :validate_json
      skip_before_action :verify_authenticity_token

      def validate_json
        JSON.parse(request.raw_post).deep_symbolize_keys
      rescue JSON::ParserError => e
        error E_INVALID_JSON, "Invalid JSON received"
        return
      end

      def error(code = E_INTERNAL, message = "API Error")
        render json:         {
          status: STATUS_ERROR,
          error_no: code,
          message: message
        }, status: 500
      end

      # @param object - a Hash or an ActiveRecord instance
      def success(object = {})
        # Serialize object automatically
        object = hash_for(object) unless object.instance_of?(Hash)

        render json:         {
          status: STATUS_OK
        }.merge(object)
      end

      def hash_for(target, serializer = nil, options = {})
        serializer ||= target.active_model_serializer
        serializer.new(target, options).serializable_hash
      end
    end
  end
end
