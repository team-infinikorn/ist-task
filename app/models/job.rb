class Job < ApplicationRecord
  belongs_to :job_queue, counter_cache: true, optional: true

  enum priority: { low: 0, high: 1, critical: 2 }
  enum status: { waiting: 0, in_progress: 1, completed: 2, failed: 3, cancelled: 4 }

  validates :name, :priority, :job_klass, :status, presence: true

  delegate :name, to: :job_queue, prefix: :queue

  store_accessor :meta, :job_klass, :arguments

  def arguments=(value)
    meta['arguments'] = value.presence || []
  end
end
