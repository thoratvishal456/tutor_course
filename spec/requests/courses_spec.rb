require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
  let(:course) { create(:course) }

  describe 'POST /courses' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          name: 'Advanced Ruby',
          description: 'Learn advanced Ruby concepts.',
          tutors_attributes: [
            { name: 'Ruby Tutor', email: 'rubytutor@example.com' },
            { name: 'Rails Tutor', email: 'rails@example.com' }
          ]
        }
      end

      it 'creates a new Course with tutors' do
        expect do
          post courses_path, params: { course: valid_attributes }
        end.to change(Course, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'returns a validation error' do
        post courses_path, params: { course: { name: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /courses' do
    it 'returns a list of courses with tutors' do
      create(:course)
      get courses_path
      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.size).to be > 0
      expect(json_response.first['tutors'].size).to be > 0
    end
  end
end
