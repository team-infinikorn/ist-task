FactoryBot.define do
  factory :member do
    sequence :email do |n|
      "member#{n}@email.com"
    end
    first_name { 'Babyface' }
    last_name { 'Combes' }
    password { 'Abcd#1234' }
    sequence :mobile do |n|
      "998877665#{n}"
    end
  end
end
