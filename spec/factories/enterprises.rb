FactoryBot.define do
  factory :enterprise do
    name { Faker::Company.name }
    rooms_number { 4 }
    opening_time { "09:00" }
    ending_time { "18:00" }
  end
end
