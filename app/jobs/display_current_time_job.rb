# frozen_string_literal: true

# Job to display current time
#
class DisplayCurrentTimeJob < ApplicationJob
  queue_as :default

  def perform(job)
    transform(job) do
      Rails.logger.info "Current time is: #{Time.current}"
    end
  end
end
