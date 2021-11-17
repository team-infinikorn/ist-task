require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe LowJobsWorker , type: :worker do
  describe "Low Job Worker" do
    let!(:job) { FactoryBot.create(:job) }
    before do
      job.reload.update(priority: 0, status: 0)
    end

    it "should respond to #perform" do
      LowJobsWorker.new.perform
      expect { LowJobsWorker.perform_async }.to change { LowJobsWorker.jobs.size }.by(1)
    end
  end
end