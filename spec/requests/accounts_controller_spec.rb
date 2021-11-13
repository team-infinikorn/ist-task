require 'swagger_helper'

describe 'Accounts API', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:member) { create :member }
  let(:Authorization) { auth_headers(member) }

  describe 'Profile API' do
    path '/accounts/profile' do
      get 'Member Profile' do
        tags 'Accounts'
        security [bearerAuth: []]
        operationId 'profile'
        consumes 'application/json'
        produces 'application/json'

        response '200', 'Successfully return profile' do
          run_test!
        end
      end
    end
  end
end
