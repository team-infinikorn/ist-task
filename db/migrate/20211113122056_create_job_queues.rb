class CreateJobQueues < ActiveRecord::Migration[6.1]
  def change
    create_table :job_queues do |t|
      t.string :name, null: false, limit: 255
      t.integer :priority, null: false, default: Job.priorities[:low]
      t.integer :jobs_count

      t.timestamps
    end
  end
end
