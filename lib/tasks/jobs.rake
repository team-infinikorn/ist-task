# frozen_string_literal: true

namespace :jobs do
  desc 'add a job to the queue'
  task :add, %i[queue_id name priority job_klass arguments] => [:environment] do |_t, args|
    queue = JobQueue.find_by id: args[:queue_id].to_i
    abort 'Could not find queue' if queue.blank?

    job = queue.jobs.build(
      { name: args[:name], priority: args[:priority], job_klass: args[:job_klass], arguments: args[:arguments].split(',') }
    )
    abort "Errors Found: #{job.errors.full_messages.to_sentence}" unless job.save

    puts 'Successfully added job to the queue'
  end

  desc 'Add & Invoke a job'
  task :invoke, %i[name priority job_klass arguments] => [:environment] do |_t, args|
    job = Job.new(
      { name: args[:name], priority: args[:priority], job_klass: args[:job_klass], arguments: args[:arguments].split(',') }
    )
    abort "Errors Found: #{job.errors.full_messages.to_sentence}" unless job.save

    job.job_klass.classify.constantize.new.perform(job)

    puts 'Successfully invoked the job.'
  end
end
