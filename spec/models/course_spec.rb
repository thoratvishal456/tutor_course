require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'is valid with a name and description' do
    course = build(:course)
    expect(course).to be_valid
  end

  it 'is invalid without a name' do
    course = build(:course, name: nil)
    expect(course).to_not be_valid
  end

  it 'is invalid with a duplicate name' do
    create(:course, name: 'Ruby on Rails Fundamentals')
    course = build(:course, name: 'Ruby on Rails Fundamentals')
    expect(course).to_not be_valid
  end

  it 'can have many tutors' do
    course = create(:course_with_tutors, tutors_count: 5)
    expect(course.tutors.size).to eq(7)
  end

  it 'deletes associated tutors when the course is deleted' do
    course = create(:course_with_tutors)
    expect { course.destroy }.to change(Tutor, :count).by(-course.tutors.size)
  end
end
