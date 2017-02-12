
class Hand
  attr_accessor  :cards, :hand_total


  def initialize
    self.cards = []
    self.hand_total = 0
  end


  def num_cards
    cards.length
  end

  def total
    cards.reduce(0) { |sum, row|  sum += row.value  }
  end

end
