require 'minitest/autorun'
require_relative 'deck'


# A deck has 52 cards
# A deck contains 13 of each suit
# A deck contains four of each face of cards
# A deck is shuffled on creation
#    Note that this required a method for redefinition of ==
#    Otherwise the objects aren't equal because they have different object IDs
# A deck can be drawn, and once a card is drawn, the deck has one less card in it

class DeckTest < MiniTest::Test

  def test_deck_has_52_cards
    deck1 = Deck.new
    assert_equal 52, deck1.cards.length
    assert deck1.cards.all? { |card| card.is_a? Card }
    # Adds test to ensure all objects in Deck are Card objects
  end

  def test_13_of_each_suit
    deck1 = Deck.new
    Card.suits.each do |suit|
      assert_equal 13, deck1.cards.select { |card| card.suit == suit }.count
    end
    # Corrects test error: undefined method []= for Card object
    # Test was written item[:suit] = "Heart" which assigns all card suits to "Heart" rather than checking them to see if they already equal "Heart"
    # This version iterates over all suits in self.suits (see Card class) and for each suit checks that there are 13 in deck1
  end

  def test_deck_has_4_of_each_face
    deck1 = Deck.new
    Card.faces.each do |face|
      assert_equal 4, deck1.cards.select { |card| card.face == face }.count
    end
    # As with previous test, this uses new method I created (self.faces) to iterate over the faces and for each face assert that there are 4 in the deck
  end


  def test_were_cards_shuffled?
    deck1 = Deck.new
    deck2 = Deck.new
    refute_equal deck1.cards, deck2.cards
  end

  def test_card_can_be_drawn_from_deck
    deck1 = Deck.new
    assert_equal 52, deck1.cards.length
    deck1.draw
    assert_equal 51, deck1.cards.length
    assert deck1.cards.all?{ |card| card.is_a? Card }
    # Creates a new deck, draws a card from the deck using draw method, checks deck length to see if it is reduced by 1
  end

end
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
