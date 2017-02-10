require 'minitest/autorun'
require_relative 'deck'

class DeckTest < MiniTest::Test

  def test_were_cards_shuffled?
    puts "in deck_test.rb test_were_cards_shuffled?"
    deck1 = Deck.new
    deck2 = Deck.new
    refute deck1.cards == deck2.cards
    puts " deck 1 in test if shuffled: #{deck1.cards.inspect}"
    puts
    puts
    puts " deck 2 in test if shuffled: #{deck2.cards.inspect}"

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
