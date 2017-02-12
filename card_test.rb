require 'minitest/autorun'
require_relative 'card.rb'

class CardTest < MiniTest::Test

# From the Assignment, the following validations should be done:
# A Card has a suit, face and value
# An Ace has a value of 14
# A King has a value of 13
# A Queen has a value of 12
# A Jack has a value of 11
# Cards can be directly compared using > and

# Notes from Lecture with Chris
# Check out in Chris' example use of def <(a), rubists format is  # def <(other)
# What do the little colons mean?  Test is a class in the module minitest
# I think Chris said because of the way it is written, you could have
# your own test?  Can't say CardTest < MiniTest because it is a module, notice
# a class
# Namespacing, MiniTest is wrapping around some methods such a Test, Assertion,
# Parse so that if you have your own, yours don't trump MiniTest
#   notice use of assert ==   vs. assert_equal
  # A Card has a suit, face and value


  def test_ace_has_suit_face_value
    card = Card.new("Heart", "Ace")
    assert card.suit == "Heart"
    assert_equal "Ace", card.face
    assert_equal 11, card.value
  end

  def test_king_has_suit_face_value
    card = Card.new("Spade", "King")
    assert card.suit == "Spade"
    assert_equal "King", card.face
    assert_equal 10, card.value
  end

  def test_queen_has_suit_face_value
    card = Card.new("Diamond", "Queen")
    assert card.suit == "Diamond"
    assert_equal "Queen", card.face
    assert_equal 10, card.value
  end

  def test_jack_has_suit_face_value
    card = Card.new("Club", "Jack")
    assert card.suit == "Club"
    assert_equal "Jack", card.face
    assert_equal 10, card.value
  end

  def test_10_has_suit_face_value
    card = Card.new("Club", "10")
    assert card.suit == "Club"
    assert_equal "10", card.face
    assert_equal 10, card.value
  end

  def test_9_has_suit_face_value
    card = Card.new("Club", "9")
    assert card.suit == "Club"
    assert_equal "9", card.face
    assert_equal 9, card.value
  end

  def test_8_has_suit_face_value
    card = Card.new("Club", "8")
    assert card.suit == "Club"
    assert_equal "8", card.face
    assert_equal 8, card.value
  end

  def test_7_has_suit_face_value
    card = Card.new("Club", "7")
    assert card.suit == "Club"
    assert_equal "7", card.face
    assert_equal 7, card.value
  end

  def test_6_has_suit_face_value
    card = Card.new("Club", "6")
    assert card.suit == "Club"
    assert_equal "6", card.face
    assert_equal 6, card.value
  end

  def test_5_has_suit_face_value
    card = Card.new("Club", "5")
    assert card.suit == "Club"
    assert_equal "5", card.face
    assert_equal 5, card.value
  end

  def test_4_has_suit_face_value
    card = Card.new("Club", "4")
    assert card.suit == "Club"
    assert_equal "4", card.face
    assert_equal 4, card.value
  end

  def test_3_has_suit_face_value
    card = Card.new("Club", "3")
    assert card.suit == "Club"
    assert_equal "3", card.face
    assert_equal 3, card.value
  end

  def test_2_has_suit_face_value
    card = Card.new("Club", "2")
    assert card.suit == "Club"
    assert_equal "2", card.face
    assert_equal 2, card.value
  end

  def test_can_compare_card_value
    card1 = Card.new("Club", "2")
    card2 = Card.new("Diamond", "King")
    assert card1.value < card2.value
    refute card1.value == card2.value
    refute card1.value > card2.value
  end


end
