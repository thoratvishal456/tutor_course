# course_representer_spec
require 'rails_helper'

RSpec.describe CourseRepresenter do
  let(:tutor1) { Tutor.new(id: 1, name: 'Vishal Test', email: 'test@example.com') }
  let(:tutor2) { Tutor.new(id: 2, name: 'Amol Test', email: 'jane@example.com') }
  let(:course) do
    Course.new(id: 1, name: 'Ruby on Rails', description: 'A comprehensive course on Ruby on Rails',
               tutors: [tutor1, tutor2])
  end

  subject { described_class.new(course).to_json }

  it 'serializes the course with its attributes' do
    expected_json = {
      id: 1,
      name: 'Ruby on Rails',
      description: 'A comprehensive course on Ruby on Rails',
      tutors: [
        { id: 1, name: 'Vishal Test', email: 'test@example.com' },
        { id: 2, name: 'Amol Test', email: 'jane@example.com' }
      ]
    }.to_json

    expect(subject).to eq(expected_json)
  end
end
