require 'swagger_helper'

describe 'Queues API', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:member) { create :member }
  let(:Authorization) { auth_headers(member) }

  describe 'Index API' do
    path '/queues' do
      get 'List Queues' do
        tags 'Queues'
        security [bearerAuth: []]
        operationId 'queues#index'
        consumes 'application/json'
        produces 'application/json'

        before { create_list :job_queue, 5 }

        response '200', 'Successfully list queues' do
          run_test! do
            expect(json_response['queues'].count).to eq 5
            expect(json_response['queues'].first.keys).to eq %w[name priority jobs_count]
          end
        end

        response '401', 'unauthorized' do
          let(:Authorization) { nil }

          run_test!
        end
      end
    end
  end

  describe 'Create API' do
    path '/queues' do
      post 'Create Queue' do
        tags 'Queues'
        security [bearerAuth: []]
        operationId 'queues#create'
        consumes 'application/json'
        produces 'application/json'

        parameter name: :queue, in: :body, schema: { '$ref' => '#/definitions/queue' }

        response '200', 'Successfully create queue' do
          let(:queue) { { queue: { name: 'Queue name', priority: 'high' } } }

          run_test!
        end

        response '422', 'unprocessable entity' do
          let(:queue) { { queue: { name: '', priority: 'high' } } }

          run_test!
        end

        response '401', 'unauthorized' do
          let(:queue) { {} }
          let(:Authorization) { nil }

          run_test!
        end
      end
    end
  end
end
