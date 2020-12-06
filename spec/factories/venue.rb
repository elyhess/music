FactoryBot.define do
  factory :venue do
    name { FFaker::Company.name }
    outdoor { [true, false].sample }
    capacity { [*0..100].sample }
    created_at { (Time.now - rand(15552000)).strftime('%m/%d/%Y %I:%M:%S %p') } 
  end
end