# spec/factories/courses.rb
FactoryBot.define do
  factory :course do
    name { 'Ruby on Rails Fundamentals' }
    description { 'A comprehensive course on Ruby on Rails' }

    after(:create) do |course|
      create_list(:tutor, 2, course:)
    end

    factory :course_with_tutors do
      transient do
        tutors_count { 3 }
      end

      after(:create) do |course, evaluator|
        create_list(:tutor, evaluator.tutors_count, course:)
      end
    end
  end
end
