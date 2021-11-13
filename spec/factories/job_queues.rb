FactoryBot.define do
  factory :job_queue do
    name { Faker::Name.name }
    priority { 0 }
  end
end
