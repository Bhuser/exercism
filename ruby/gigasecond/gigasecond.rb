
class Gigasecond

  SECONDS = 1_000_000_000

  def self.from (date_time)
    return date_time += SECONDS
  end
end

module BookKeeping
  VERSION = 6
end