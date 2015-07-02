require "socket"

module Api
  module V1

    STATUS_OK = "ok"
    STATUS_ERROR = "error"

    E_INVALID_JSON = 1
    E_ACCESS_DENIED = 2
    E_INTERNAL = 3
    E_RESOURCE_NOT_FOUND = 4
    E_INVALID_PARAM = 5
    E_API = 6
    E_METHOD_NOT_FOUND = 7
    E_UNSUPPORTED = 8

    VERSION = "1.1.0"


    STRINGWIRE_API_URL = "http://localhost:3000"
    STRINGWIRE_API_HOSTNAME = "localhost"
    STRINGWIRE_API_PORT = 3000
    STRINGWIRE_API_HTTPS = 0

    class CatchJsonParseErrors
      def initialize(app)
        @app = app
      end

      def call(env)
        @app.call(env)
      rescue ActionDispatch::ParamsParser::ParseError => error
        Bugsnag.notify(error)
        error_output = "There was a problem in the JSON you submitted"
        return [
          500,
          { "Content-Type" => "application/json" },
          [{ status: STATUS_ERROR, error_no: E_INVALID_JSON, message: error_output }.to_json]
        ]
      end
    end

  end
end
