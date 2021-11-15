class ApplicationJob < ActiveJob::Base
  def transform(job)
    job.in_progress!
    yield
    job.completed!
  rescue StandardError
    job.failed!
  end
end
