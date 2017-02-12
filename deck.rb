require_relative 'card.rb'

class Deck

  attr_accessor :cards

  def initialize
    self.cards = []
    suit_array = ["Heart", "Club", "Spade", "Diamond"]
    suit_array.each do |x|
      13.times do |counter|
         face_array = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
         cards << Card.new(x, face_array[counter])
      end
    end
    cards.shuffle!
  end

  def draw
    cards.shift
  end

  def self.count

  end

end


# Add a method to draw
#    Drawing two cards, cards.shift(2) ....
#    dry?  cards.empty? -- works with the test.rb
