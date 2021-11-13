module Api
  module V1
    module Devise
      class RegistrationsController < ::Devise::RegistrationsController
        respond_to :json

        private

        def sign_up_params
          params.require(:sign_up).permit(%i[email password name mobile])
        end
      end
    end
  end
end
