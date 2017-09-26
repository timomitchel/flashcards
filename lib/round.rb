require "./lib/guess"
require "./lib/card"


class Round

  attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    @current_card = 0
  end

  def current_card
    @deck.cards[@current_card]
  end

  def record_guess(response)
    @guesses << Guess.new(response, current_card)
    guess = @guesses.last
    if guess.correct?
      @number_correct += 1
    else
      @number_correct
    end
    @current_card += 1
  end

  def percent_correct
  (@number_correct.to_f / deck.cards.length * 100).to_i
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.count} cards"
    sleep 1.5
    puts "---------------------------------"
    sleep 1.5
    deck.cards.each do |card|
    puts "This is card number #{@current_card + 1} out of #{deck.cards.count}"
    sleep 1.5
    puts "Question: #{card.question}"
    input = gets.chomp
    record_guess(input)
      puts "#{guesses.last.feedback}"
      sleep 1.5
    end
    puts "******* Game over! *******"
    sleep 1.5
    puts "You had #{@number_correct} correct guesses out of #{deck.cards.count} for a score of #{percent_correct}"
  end

end
