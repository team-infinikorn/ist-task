module Api
  module V1
    class AccountsController < SecureController
      before_action :authenticate_member!

      def profile
        render_okay current_member
      end
    end
  end
end
