FactoryBot.define do
  factory :venue do
    name { FFaker::Company.name }
    outdoor { [true, false].sample }
    capacity { [*0..100].sample }
  end
end