class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :name, null: false, limit: 255
      t.integer :status, null: false, default: Job.statuses[:waiting]
      t.integer :priority, null: false, default: Job.priorities[:low]
      t.jsonb :meta, null: false, default: {}
      t.references :job_queue

      t.timestamps
    end
  end
end
