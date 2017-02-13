require_relative 'deck.rb'
require_relative 'hand.rb'
require 'tty'


class BlackJack
  attr_accessor :deck, :dealer, :player, :prompt, :winner

  def initialize         #======================================
    self.deck = Deck.new
    self.dealer= Hand.new
    self.player = Hand.new
    @prompt = TTY::Prompt.new
    self.winner = false
  end

  def hit?               #======================================
    show_hand
    desire = false
    desire = prompt.yes?("Would you like another card?") if player.total < 21
    if desire
      player.cards << deck.draw
      hit?
    end
  end

  def show_hand          #======================================
    puts "Your hand"
    player.cards.each do |card|
      puts "     #{card.suit} #{card.face}"
      # From Demetra: Deleted x and replaced with 'card' so the method is easier to understand, deleted #{x.value} to make terminal output easier to read
    end
    puts "Current total for your hand #{player.total}"
  end

  def dealer_hit?        #======================================
    if dealer.total < 16
      dealer.cards << deck.draw
      dealer_hit?
    end
  end


  def show_dealer_hand   #======================================
    dealer_hit?
    puts "Dealer's Hand:"

    dealer.cards.each do |card|
      puts "     #{card.suit} #{card.face}"
      # From Demetra: Deleted x and replaced with 'card' so the method is easier to understand, deleted #{x.value} to make terminal output easier to read
    end
    puts "Dealer Total: #{dealer.total}"
  end

  def deal_cards          #======================================
    2.times {self.player.cards << deck.draw}
    2.times {self.dealer.cards << deck.draw}

    puts "Dealer card showing: #{dealer.cards[0].suit} #{dealer.cards[0].face}"
    # From Demetra: Deleted #{dealer.cards[0].value} to make it easier to read in terminal
  end

  def player_wins         #======================================
    puts "***you win * you win * you win * you win***"
  end

  def dealer_wins         #======================================
    puts "      you lose to the dealer   "
  end

  def determine_winner   #======================================

    # tie situation

    # From Demetra: I changed the following line using the new bust method I wrote - now the game will know what a bust is! In this case, you probably want to check that they both are NOT busted...but if you are using real life rules that may be different than what I am thinking of. Currently, this will check if they are both busted OR the totals are equal. What ends up happening is a player can bust, and then a dealer can also bust, and then the player and dealer show as 'tied' and the player wins. Game logic probably needs to be ironed out.
    if (bust?(dealer) && bust?(player)) || dealer.total == player.total
       puts " Score tied, player number of cards:  #{player.num_cards} dealer:  #{dealer.num_cards}"
       if player.total == 21
         player_wins
       else
         if player.num_cards >= dealer.num_cards
           player_wins
         else
           dealer_wins
         end
       end
    else
      if (player.total > dealer.total) && player.total < 22
        player_wins
      else
        dealer_wins
      end
    end
  end

  # From Demetra: The way I approached a tie was to check specifically those conditions under which a player wins. If player and dealer hands are the exact same value AND the same length, or if the player has more cards, the player wins. It looks like this:

  # def player_wins_tie?
  #   total_hand(player_hand) == total_hand(dealer_hand) && player_hand.length >= dealer_hand.length
  # end

  def bust?(hand)
    hand.total > 21
    # From Demetra: this will return true if a hand you pass in is over 21
    # Consider using this to either initially check for a bust (when hands are first dealt) or to check for a bust during the player and dealer turns
  end


  def play               #======================================
# This was really confusing you so don't lose delete these comments!!!!!
  #  2.times do
  #    player_hand << deck.cards.shift
  #  end

#Push command pushes whatever is one the right side of the array, into the array
#so if it is an array, the array gets an array
#if it is added with the += you get the values, not the array

    deal_cards
    if dealer.total == 21
      puts "Game Over, dealer received a natural 21"
    else
      hit?
      dealer_hit? if player.total < 21
    end
    show_dealer_hand
    determine_winner
    another_game?

    # From Demetra: I like the way you have the player's turn complete, and then run the dealer's turn, and then determine the winner. 

  end


  def another_game?     #======================================
    desire = prompt.yes?("Would you like to play another game?")
    if desire
      BlackJack.new.play
    else
      puts "Thanks for playing Black Jack, see ya later!!!"
    end
  end


end


BlackJack.new.play
