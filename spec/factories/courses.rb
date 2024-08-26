# spec/factories/courses.rb
FactoryBot.define do
  factory :course do
    name { "Ruby on Rails Fundamentals" }
    description { "A comprehensive course on Ruby on Rails" }

    after(:create) do |course|
      create_list(:tutor, 2, course: course)
    end
  end
end
