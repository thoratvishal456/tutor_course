# spec/factories/tutors.rb
FactoryBot.define do
  factory :tutor do
    name { "John Doe" }
    email { Faker::Internet.email }
    association :course
  end
end
