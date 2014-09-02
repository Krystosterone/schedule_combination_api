class TrimesterRepresentation < Representable::Decorator
  include Representable::JSON

  property :year
  property :term_slug
  property :category

  collection :bachelors, class: Bachelor, decorator: BachelorRepresentation
  collection_representer class: Bachelor
end