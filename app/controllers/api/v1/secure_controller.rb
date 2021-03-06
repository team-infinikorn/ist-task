module Api
  module V1
    class SecureController < ApiController
      before_action :authenticate_member!

      private

      def authenticate_member!
        return head :unauthorized if request.headers['Authorization'].blank?

        authenticate_or_request_with_http_token do |token|
          jwt_payload = JWT.decode(token, ENV['SECRET_KEY_BASE']).first

          @current_member_id = jwt_payload['id']
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          # :nocov:
            head :unauthorized
          # :nocov:
        end
      end

      def current_member
        @current_member || Member.find(@current_member_id)
      end
    end
  end
end
