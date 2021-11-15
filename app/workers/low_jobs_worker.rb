# frozen_string_literal: true

# Worker to run dynamic jobs from queues
#
class LowJobsWorker
  include Sidekiq::Worker

  sidekiq_options queue: :default

  def perform
    Job.low.waiting.each do |job|
      active_job(job).perform_later(job)
    end
  end

  private

  def active_job(job)
    job.job_klass.classify.constantize
  end
end
