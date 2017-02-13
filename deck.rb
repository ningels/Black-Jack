require_relative 'card.rb'

class Deck

  attr_accessor :cards

  def initialize
    self.cards = make_cards
    self.cards.shuffle!
  end

  def make_cards
    Card.suits.flat_map do |suit|
      Card.faces.map do |face|
         Card.new(suit, face)
      end
    end
  end

  def draw
    cards.shift
  end

end


# Add a method to draw
#    Drawing two cards, cards.shift(2) ....
#    dry?  cards.empty? -- works with the test.rb
