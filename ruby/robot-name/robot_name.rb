
class Robot

  def self.forget
    @name = nil
  end

  def reset
    @name = nil
  end

  def name
    @name ||= '%s%03d' % [(0...2).map { ('A'..'Z').to_a[rand(26)] }.join, rand(100)]
        # letters + numbers
  end

  def letters
    [*('A'..'Z')].sample(2).join
  end

  def numbers
    # 3.times.map{rand(10)}.join
    rand(100..999).to_s
  end
end

module BookKeeping
  VERSION = 3
end