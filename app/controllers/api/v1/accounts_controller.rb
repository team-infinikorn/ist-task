module Api
  module V1
    class AccountsController < SecureController
      def profile
        render_okay current_member
      end
    end
  end
end
