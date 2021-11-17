FactoryBot.define do
  factory :job do
    name { Faker::Name.name }
    status { 0 }
    priority { 0 }
    meta { { job_klass: 'DisplayCurrentTimeJob', arguments: [] } }

    job_queue
  end
end
