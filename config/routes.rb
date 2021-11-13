Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      devise_for(
        :members,
        controllers: { sessions: 'api/v1/devise/sessions', registrations: 'api/v1/devise/registrations' },
        path_names: { sign_in: :login },
        defaults: { format: :json },
        skip: [:confirmations, :passwords]
      )

      scope :accounts do
        get 'profile' => 'accounts#profile'
      end
    end
  end
end
