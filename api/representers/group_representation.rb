class GroupRepresentation < Representable::Decorator
  include Representable::JSON

  property :nb

  collection :periods, class: Period, decorator: PeriodRepresentation
end