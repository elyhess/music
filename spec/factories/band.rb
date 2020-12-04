FactoryBot.define do
  factory :band do
    name { FFaker::Company.name }
    booked { [true, false].sample }
  end
end