class BachelorRepresentation < Representable::Decorator
  include Representable::JSON

  property :slug

  collection :courses, class: Course, decorator: CourseRepresentation
end