require 'rails_helper'

RSpec.describe JobQueue, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:priority) }

  it { is_expected.to have_many(:jobs).dependent(:destroy) }
end
