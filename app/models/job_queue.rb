# frozen_string_literal: true

class JobQueue < ApplicationRecord
  has_many :jobs, dependent: :destroy

  enum priority: { low: 0, high: 1, critical: 2 }

  validates :name, :priority, presence: true
end
