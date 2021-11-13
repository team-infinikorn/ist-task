# frozen_string_literal: true

# Creates a new Job
#
class CreateJob < ApplicationInteractor
  delegate :queue, :job, :job_params, to: :context

  # @!method self.call(queue:, job_params:)
  #   @param queue [JobQueue] JobQueue Model
  #   @param job_params [Hash] job_params params hash
  #
  #   @return [Interactor::Context]

  def call
    context.job = queue.jobs.build(job_params)
    return if job.save

    error job.errors
  end
end
