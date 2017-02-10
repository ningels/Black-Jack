require_relative 'deck.rb'
require 'tty'


class BlackJack
  attr_accessor :deck, :dealer_hand, :player_hand, :prompt, :player_total, :dealer_total

  def initialize
    self.deck = Deck.new
    self.dealer_hand = []
    self.player_hand = []
    @prompt = TTY::Prompt.new
    self.player_total = 0
    self.dealer_total = 0
  end

  def hit?
    show_hand

    desire = prompt.yes?("Would you like another card?") if player_total <= 21
    if desire
      player_hand << deck.cards.shift
      hit?
    end
  end

  def show_hand
    puts "Your hand"
    player_hand.each do |x|
      puts "     #{x.suit} #{x.face} #{x.value}"
    end
    self.player_total =  player_hand.reduce(0)  { |sum, row|  sum += row.value  }
    puts "Current total for your hand #{self.player_total}"
  end

  def dealer_hit?
    self.dealer_total = dealer_hand.reduce(0) { |sum, row|  sum += row.value  }
    if dealer_total <= 16
      dealer_hand << deck.cards.shift
      dealer_hit?
    end
  end




  def show_dealer_hand
    self.dealer_total = 0
    dealer_hand.each do |x|
      puts "     #{x.suit} #{x.face} #{x.value}"
      self.dealer_total += x.value
    end
    puts "Dealer hand: #{self.dealer_total}"
  end

  def deal_cards
    self.player_hand += deck.cards.shift(2)
    self.dealer_hand += deck.cards.shift(2)
    puts "Dealer card showing: #{dealer_hand[1].suit} #{dealer_hand[1].face} #{dealer_hand[1].value}"
  end

  def determine_winner
    show_dealer_hand


    if player_total == 21
       puts "***you win * you win * you win * you win***"
    elsif player_total > 21
      if dealer_total > 21
        puts "you tied"
      elsif
        puts "you busted &*$^@(&%^#))"
      end
    else
      if dealer_total > 21
         puts "***you win * you win * you win * you win***"
      elsif
        if player_total >= dealer_total
          puts "***you win * you win * you win * you win***"
        elsif
          puts "you lose, boo hoo"
        end
      end


    end



  end

  def play
# This was really confusing you so don't lose delete these comments!!!!!
  #  2.times do
  #    player_hand << deck.cards.shift
  #  end

#Push command pushes whatever is one the right side of the array, into the array
#so if it is an array, the array gets an array
#if it is added with the += you get the values, not the array

    deal_cards
    hit?

    dealer_hit? if player_total < 21
    determine_winner


    desire = prompt.yes?("Would you like to play another game?")
    if desire
      BlackJack.new.play
    else
      puts "Thanks for playing Black Jack, see ya later!!!"
    end
  end

end

BlackJack.new.play
