
class Card

  def self.suits
    %w(Heart Club Spade Diamond)
  end

  def self.faces
    %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  end

  def self.face_cards
    face_card_array = {
                        "Jack"  => 10,
                        "Queen" => 10,
                        "King" => 10,
                        "Ace" => 11
                      }
  end

  attr_accessor  :suit, :face, :value
  #defines two methods, sets a nil instance variable by itself...
  #set @value to test having total cards of 6 or more and under 21 win

  def initialize(suit, face)
    @suit = suit
    @face = face.to_s
    @value = determine_value
  end

  def determine_value
    if face.to_i.to_s == face
      self.class.faces.index(face) + 2
    else
      self.class.face_cards[face]
    end
  end


  def ==(another_card)
    self.suit == another_card.suit && self.face == another_card.face && self.value == another_card.value
  end

end
