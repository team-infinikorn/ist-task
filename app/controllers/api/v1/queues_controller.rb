module Api
  module V1
    class QueuesController < SecureController
      def index
        @queues = JobQueue.includes(:jobs)
      end

      def create
        result = CreateQueue.call(queue_params: queue_params)

        if result.success?
          render_okay result.queue
        else
          render_unprocessable_entity errors: result.errors
        end
      end

      private

      def queue_params
        params.require(:queue).permit(%i[name priority])
      end
    end
  end
end
