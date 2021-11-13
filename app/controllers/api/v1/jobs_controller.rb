module Api
  module V1
    class JobsController < SecureController
      before_action :set_queue

      def index
        @jobs = Job
      end

      def create
        result = CreateJob.call(queue: @queue, job_params: job_params)

        if result.success?
          render_okay result.job
        else
          render_unprocessable_entity errors: result.errors
        end
      end

      private

      def job_params
        params.require(:job).permit(:name, :priority, :job_klass, arguments: [])
      end

      def set_queue
        @queue = JobQueue.find params[:job_queue_id]
      end
    end
  end
end
