class CoursesController < ApplicationController
  def index
    courses = Course.includes(:tutors).all
    render json: courses.to_json(include: :tutors), status: :ok
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: course, status: :created
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, tutors_attributes: [:name, :email])
  end  
end
