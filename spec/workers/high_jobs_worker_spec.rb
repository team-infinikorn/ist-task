require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe HighJobsWorker , type: :worker do
  describe "High Job Worker" do
    let!(:job) { FactoryBot.create(:job) }
    before do
      job.reload.update(priority: 1, status: 0)
    end

    it "should respond to #perform" do
      HighJobsWorker.new.perform
      expect { HighJobsWorker.perform_async }.to change { HighJobsWorker.jobs.size }.by(1) 
    end
  end
end