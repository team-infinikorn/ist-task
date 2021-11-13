json.queues @queues do |queue|
  json.call(queue, :name, :priority, :jobs_count)
end
