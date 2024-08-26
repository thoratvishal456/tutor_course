require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Tutor, type: :model do
  it 'is valid with a name, email, and course' do
    tutor = build(:tutor)
    expect(tutor).to be_valid
  end

  it 'is invalid without a name' do
    tutor = build(:tutor, name: nil)
    expect(tutor).to_not be_valid
  end

  it 'is invalid without an email' do
    tutor = build(:tutor, email: nil)
    expect(tutor).to_not be_valid
  end

  it 'is invalid without a course' do
    tutor = build(:tutor, course: nil)
    expect(tutor).to_not be_valid
  end

  it 'is invalid with a duplicate email within the same course' do
    course = create(:course)
    create(:tutor, email: 'test@example.com', course:)
    tutor = build(:tutor, email: 'test@example.com', course:)
    expect(tutor).to_not be_valid
  end

  it 'is invalid with a duplicate email across different courses' do
    course1 = create(:course)
    course2 = create(:course, name: 'Another Course')
    create(:tutor, email: 'test@example.com', course: course1)
    tutor = build(:tutor, email: 'test@example.com', course: course2)
    expect(tutor).to_not be_valid
  end
end
# rubocop:enable Metrics/BlockLength
