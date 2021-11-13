require 'rails_helper'

RSpec.describe Job, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:priority) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:job_klass) }

  it { is_expected.to belong_to(:job_queue).counter_cache }
end
