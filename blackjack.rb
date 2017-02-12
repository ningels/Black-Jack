require_relative 'deck.rb'
require_relative 'hand.rb'
require 'tty'


class BlackJack
  attr_accessor :deck, :dealer, :player, :prompt, :dealer_total

  def initialize
    self.deck = Deck.new
    self.dealer= Hand.new
    self.player = Hand.new
    @prompt = TTY::Prompt.new
    self.dealer_total = 0
  end

  def hit?
    show_hand
    desire = false
    desire = prompt.yes?("Would you like another card?") if player.total <= 21
    if desire
      player.cards << deck.draw
      hit?
    end
  end

  def show_hand
    puts "Your hand"
    player.cards.each do |x|
      puts "     #{x.suit} #{x.face} #{x.value}"
    end

    puts "Current total for your hand #{player.total}"

  end

  def dealer_hit?
    self.dealer_total = dealer.cards.reduce(0) { |sum, row|  sum += row.value  }
    if dealer_total <= 16
      dealer.cards << deck.draw
      dealer_hit?
    end
  end




  def show_dealer_hand
    dealer_hit?
    puts "in show dealer hand"
    self.dealer_total = 0
    dealer.cards.each do |x|
      puts "     #{x.suit} #{x.face} #{x.value}"
      self.dealer_total += x.value
    end
    puts "Dealer hand: #{self.dealer_total}"
  end

  def deal_cards
    2.times {self.player.cards << deck.draw}


    2.times {self.dealer.cards << deck.draw}

    puts "Dealer card showing: #{dealer.cards[0].suit} #{dealer.cards[0].face} #{dealer.cards[0].value}"
  end

  def determine_winner
    show_dealer_hand

    if player.total == 21
       puts "***you win * you win * you win * you win***"
    elsif player.total > 21
      if dealer_total > 21
        puts "you tied"
      elsif
        puts "you busted &*$^@(&%^#))"
      end
    else
      if dealer_total > 21
         puts "***you win * you win * you win * you win***"
      elsif
        if player.total > dealer_total
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
    dealer.cards.each do |x|
      self.dealer_total += x.value
    end

    if dealer_total == 21
      puts "    dealer second card: #{dealer.cards[1].suit} #{dealer.cards[1].face} #{dealer.cards[1].value}"
      puts "Game Over, dealer received a natural 21"
    elsif
      hit?
      dealer_hit? if player.total < 21
    end

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
