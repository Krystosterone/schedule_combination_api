class Weekday
  attr_accessor :index

  def initialize(index = 0)
    @index = index
  end

  class << self
    def from(weekday)
      index = weekday_names.index(weekday.downcase)
      new(index) unless index.nil?
    end

    def from_short(weekday)
      index = short_weekday_names.index(weekday.downcase)
      new(index) unless index.nil?
    end

    private

    def weekday_names
      I18n.t('weekdays')
    end

    def short_weekday_names
      weekday_names.collect { |n| n[0..2] }
    end
  end

  def to_i
    @index
  end

  def ==(c)
    @index == c.index
  end
end
