# courses & its tutors
class CoursesController < ApplicationController
  def index
    courses = Course.includes(:tutors).all
    render json: CourseRepresenter.for_collection.new(courses).to_json
  end

  def create
    course = Course.new(course_params)

    if course.save
      render json: CourseRepresenter.new(course).to_json, status: :created
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  def update
    course = Course.find(params[:id])

    if course.update(course_params)
      render json: CourseRepresenter.new(course).to_json, status: :ok
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, tutors_attributes: %i[id name email _destroy])
  end
end
