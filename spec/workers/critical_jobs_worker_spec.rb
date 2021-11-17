require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe CriticalJobsWorker , type: :worker do
  describe "Critical Job Worker" do
    let!(:job) { FactoryBot.create(:job) }
    before do
      job.reload.update(priority: 2, status: 0)
    end

    it "should respond to #perform" do
      CriticalJobsWorker.new.perform 
      expect { CriticalJobsWorker.perform_async }.to change { CriticalJobsWorker.jobs.size }.by(1)
    end
  end
end