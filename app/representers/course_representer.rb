# CourseRepresenter
class CourseRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :name
  property :description
  collection :tutors, decorator: TutorRepresenter, class: Tutor
end
