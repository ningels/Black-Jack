
class Hand
  attr_accessor  :cards


  def initialize
    self.cards = []
  end


  def num_cards
    cards.length
  end

  def total
    cards.reduce(0) { |sum, row|  sum += row.value  }
  end

end
