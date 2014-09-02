class PeriodRepresentation < Representable::Decorator
  include Representable::JSON

  property :weekday_index
  property :type
  property :start_time
  property :end_time
end