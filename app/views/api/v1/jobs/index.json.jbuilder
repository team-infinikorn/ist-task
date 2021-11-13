json.jobs @jobs.find_each do |job|
  json.call(job, :name, :priority, :status, :job_klass, :arguments, :queue_name, :job_queue_id)
end
