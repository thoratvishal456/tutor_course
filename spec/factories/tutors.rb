# spec/factories/tutors.rb
FactoryBot.define do
  factory :tutor do
    name { 'Vishal Test' }
    email { Faker::Internet.email }
    association :course
  end
end
