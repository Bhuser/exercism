class Allergies

  VALUES = {
      'eggs'         => 1,
      'peanuts'      => 2,
      'shellfish'    => 4,
      'strawberries' => 8,
      'tomatoes'     => 16,
      'chocolate'    => 32,
      'pollen'       => 64,
      'cats'         => 128,
  }

  def initialize(score)
    @score = score
  end

  def allergic_to?(item)
    @score & VALUES[item] !=0
  end

  def list
    VALUES.select {|allergen| allergic_to?(allergen)}.keys()
  end

end