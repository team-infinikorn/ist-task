require 'rails_helper'

RSpec.describe StoreMoviesJob, type: :job do
  describe '#perform_movies_job' do
    let!(:job) { create :job, arguments: ['data_sets/movies.yml']}

    context 'when job completed' do
      it 'should create movies' do
        response = StoreMoviesJob.perform_now(job)

        expect(Movie.count).to eq(10)
        expect(job).to be_completed
      end
    end

    context 'when job failed' do
      before do
        allow(YAML).to receive(:load_file).and_raise(StandardError)
      end

      it 'is not successful' do
        StoreMoviesJob.perform_now(job)

        expect(job).to be_failed
      end
    end
  end
end