module Api
  module V1
    class SecureController < ApiController
      before_action :authenticate_member

      private

      def authenticate_member
        return head :unauthorized if request.headers['Authorization'].blank?

        authenticate_or_request_with_http_token do |token|
          jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

          @current_member_id = jwt_payload['id']
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          head :unauthorized
        end
      end

      def authenticate_member!(_options = {})
        head :unauthorized unless signed_in?
      end

      def current_member
        @current_member || Member.find(@current_member_id)
      end

      def signed_in?
        @current_member_id.present?
      end
    end
  end
end
