# frozen_string_literal: true

# Creates a new Queue
#
class CreateQueue < ApplicationInteractor
  delegate :queue_params, to: :context
  delegate :queue, to: :context

  # @!method self.call(job_params:)
  #   @param queue_params [Hash] job_queue params hash
  #
  #   @return [Interactor::Context]

  def call
    context.queue = JobQueue.new(queue_params)
    return if queue.save

    error queue.errors
  end
end
