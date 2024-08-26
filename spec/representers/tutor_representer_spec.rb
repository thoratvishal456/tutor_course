# tutor_representer_spec
require 'rails_helper'

RSpec.describe TutorRepresenter do
  let(:tutor) { Tutor.new(id: 1, name: 'John Doe', email: 'john@example.com') }

  subject { described_class.new(tutor).to_json }

  it 'serializes the tutor with its attributes' do
    expected_json = {
      id: 1,
      name: 'John Doe',
      email: 'john@example.com'
    }.to_json

    expect(subject).to eq(expected_json)
  end
end
