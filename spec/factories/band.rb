FactoryBot.define do
  factory :band do
    name { FFaker::Company.name }
    booked { [true, false].sample }
    created_at { (Time.now - rand(15552000)).strftime('%m/%d/%Y %I:%M:%S %p') } 
  end
end