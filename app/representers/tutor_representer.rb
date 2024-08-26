# TutorRepresenter
class TutorRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :name
  property :email
end
