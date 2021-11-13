require 'swagger_helper'

describe 'Registration API', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:member_password) { 'Abcd#1234' }
  let(:member) { build :member, password: member_password }

  describe 'Registration API' do
    path '/members' do
      post 'Member Registration' do
        tags 'Accounts'
        operationId 'registration'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :sign_up, in: :body, schema: { '$ref' => '#/definitions/sign_up' }

        response '200', 'Successfull Registration' do
          let(:mock_mailer) { instance_double('mailer') }

          before do
            allow(Devise::Mailer).to receive(:confirmation_instructions).and_return(mock_mailer)
            allow(mock_mailer).to receive(:deliver)
          end

          let(:sign_up) do
            {
              sign_up: {
                email: member.email,
                password: member_password,
                name: member.name,
                mobile: member.mobile
              }
            }
          end

          run_test! do
            expect(json_response['member']['auth_token'].present?).to be_truthy
          end
        end
      end
    end
  end
end
