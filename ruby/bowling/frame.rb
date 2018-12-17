class Frame
  def <<(score)
    rolls << score if extendable?
    check_valid_frame
  end

  def extendable?
    rolls.length < 2 ||
      (rolls[0] == 10 && rolls.length < 3) ||
      (rolls[0] + rolls[1] == 10 && rolls.length < 3)
  end

  def start_next_frame?
    rolls[0] == 10 || rolls.length > 1
  end

  def score
    @rolls.inject(0, :+)
  end

  private

  def rolls
    @rolls ||= []
  end

  def check_valid_frame
    raise BowlingError if
        rolls.length == 2 &&
        rolls[0] < 10 &&
        rolls[0] + rolls[1] > 10
  end
end