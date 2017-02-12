
class Card
  attr_accessor  :suit, :face, :value
  #defines two methods, sets a nil instance variable by itself...
  #set @value to test having total cards of 6 or more and under 21 win

  def initialize(suit, face)
    @suit = suit
    @face = face.to_s
    @value = determine_value
  end

  def determine_value
    face_array = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    array_position = face_array.index(face)

    if array_position < 9
      self.value = array_position += 2
    elsif array_position == 12
      self.value = 11
    else
      self.value = 10
    end
#    puts "suit face value #{suit}, #{face}, #{value}"
#    return self.value
  end

  def ==(another_card)
    self.suit == another_card.suit && self.face == another_card.face && self.value == another_card.value
  end




end
