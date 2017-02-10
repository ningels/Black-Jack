require 'minitest/autorun'
require_relative 'card.rb'

class CardTest < MiniTest::Test

# What do the little colons mean?  Test is a class in the module minitest
# I think Chris said because of the way it is written, you could have
# your own test?  Can't say CardTest < MiniTest because it is a module, notice
# a class
# Namespacing, MiniTest is wrapping around some methods such a Test, Assertion,
# Parse so that if you have your own, yours don't trump MiniTest

  def test_card_for_face_and_value
    card = Card.new("Diamonds", "8", 8)
    assert card.suit == "Diamonds"
    assert_equal "8", card.face

    #   notice use of assert ==   vs. assert_equal
  end

# Check out in Chris' example use of def <(a), rubists format is
# def <(other)

end
