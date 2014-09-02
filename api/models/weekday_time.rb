class WeekdayTime

  MINUTES_PER_HOUR = 60

  attr_accessor :hour, :minutes

  def initialize(hour = 0, minutes = 0)
    @hour = hour
    @minutes = minutes
  end

  class << self
    def from_s(time)
      hour, minutes = to_i(time.split("h"))
      new(hour, minutes) unless hour.nil? || minutes.nil?
    end

    def from_i(time)
      hour = time / MINUTES_PER_HOUR
      minutes = time % MINUTES_PER_HOUR
      new(hour, minutes)
    end

    private

    def to_i(parts)
      parts.collect { |p| Integer(p.gsub(/^0/, "")) } rescue parts.collect { nil }
    end
  end

  def to_i
    hour * MINUTES_PER_HOUR + minutes
  end

  def to_s
    "#{zerofill(hour)}h#{zerofill(minutes)}"
  end

  def ==(c)
    to_i == c.to_i
  end

  private

  def zerofill(time)
    time.to_s.rjust(2, "0")
  end

end
