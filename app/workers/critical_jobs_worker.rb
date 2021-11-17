# frozen_string_literal: true

# Worker to run critical jobs from queues
#
class CriticalJobsWorker
  include Sidekiq::Worker

  sidekiq_options queue: :critical

  def perform
    Job.critical.waiting.each do |job|
      active_job(job).perform_later(job)
    end
  end

  private

  def active_job(job)
    job.job_klass.classify.constantize
  end
end
