class CourseRepresentation < Representable::Decorator
  include Representable::JSON

  property :name

  collection :groups, class: Group, decorator: GroupRepresentation
end