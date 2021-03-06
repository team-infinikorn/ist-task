# frozen_string_literal: true

# Worker to run high jobs from queues
#
class HighJobsWorker
  include Sidekiq::Worker

  sidekiq_options queue: :high

  def perform
    Job.high.waiting.each do |job|
      active_job(job).perform_later(job)
    end
  end

  private

  def active_job(job)
    job.job_klass.classify.constantize
  end
end
