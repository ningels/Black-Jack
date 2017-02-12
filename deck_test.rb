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
    puts "deck1.cards.length: #{deck1.cards.length}"
    puts "deck1.cards.count: #{deck1.cards.count}"
    assert_equal 52, deck1.cards.length
  end

  def test_13_of_each_suit
    deck1 = Deck.new

    deck_by_suit = deck1.cards.select{ |item| item[:suit] = "Heart" }
    display deck_by_suit.inspect

  end


  def test_were_cards_shuffled?
    deck1 = Deck.new
    deck2 = Deck.new
    refute_equal deck1.cards, deck2.cards
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
