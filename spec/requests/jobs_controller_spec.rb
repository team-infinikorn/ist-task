require 'swagger_helper'

describe 'Jobs API', type: :request, swagger_doc: 'v1/swagger.json' do
  let(:member) { create :member }
  let(:Authorization) { auth_headers(member) }
  let!(:job_queue) { create :job_queue }

  describe 'Index API' do
    path '/queues/{job_queue_id}/jobs' do
      get 'List Jobs' do
        tags 'Jobs'
        security [bearerAuth: []]
        operationId 'jobs#index'
        consumes 'application/json'
        produces 'application/json'

        parameter name: :job_queue_id, in: :path, required: true

        before { create_list :job, 5, job_queue: job_queue }

        response '200', 'Successfully list jobs' do
          let(:job_queue_id) { job_queue.id }

          run_test! do
            expect(json_response['jobs'].count).to eq 5
            expect(json_response['jobs'].first.keys).to eq %w[name priority status job_klass arguments queue_name job_queue_id]
          end
        end

        response '401', 'unauthorized' do
          let(:job_queue_id) { job_queue.id }
          let(:Authorization) { nil }

          run_test!
        end
      end
    end
  end

  describe 'Create API' do
    path '/queues/{job_queue_id}/jobs' do
      post 'Create Job' do
        tags 'Jobs'
        security [bearerAuth: []]
        operationId 'jobs#create'
        consumes 'application/json'
        produces 'application/json'

        parameter name: :job_queue_id, in: :path, required: true
        parameter name: :job, in: :body, schema: { '$ref' => '#/definitions/job' }

        response '200', 'Successfully create job' do
          let(:job_queue_id) { job_queue.id }
          let(:job) { { job: { name: 'Queue Job', priority: 'high', job_klass: 'DisplayCurrentTime', arguments: [] } } }

          run_test!
        end

        response '422', 'unprocessable entity' do
          let(:job_queue_id) { job_queue.id }
          let(:job) { { job: { name: '', priority: 'high', job_klass: '', arguments: [] } } }

          run_test!
        end

        response '401', 'unauthorized' do
          let(:job) { {} }
          let(:Authorization) { nil }
          let(:job_queue_id) { job_queue.id }

          run_test!
        end
      end
    end
  end
end
