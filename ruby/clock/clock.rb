class Clock

  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24

  class << self
    alias_method :at, :new
  end

  def initialize (hour, min = 0)
    @hour, @min = hour, min
    time
  end

  def to_s
    format('%02d:%02d', @hour, @min)
  end

  def + (minutes)
    self.class.new(@hour, @min + minutes)
  end

  def == (time)
    to_s == time.to_s
  end

  def time
    @hour += (@min/MINUTES_IN_HOUR)
    @hour %= HOURS_IN_DAY
    @min %= MINUTES_IN_HOUR
  end
end

module BookKeeping
  VERSION = 2
end