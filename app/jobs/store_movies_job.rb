# frozen_string_literal: true

# Job to store movies
#
class StoreMoviesJob < ApplicationJob
  queue_as :default

  def perform(job)
    transform(job) do
      filepath = job.arguments[0] # Could be any path e.g. S3 Filepath
      hash = YAML.load_file(filepath)

      hash['movies'].each do |movie|
        Movie.where(title: movie['title']).first_or_create
      end
    end
  end
end
