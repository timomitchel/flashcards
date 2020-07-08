require "./lib/guess"
require "./lib/card"

class Round

  attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    @card_position = 0
  end

  def current_card
    @deck.cards[@card_position]
  end

  def delay_output(seconds)
    sleep seconds
  end

  def check_guess(guess)
    @number_correct += 1 if guess.correct?
  end

  def record_guess(response)
    @guesses << Guess.new(response.to_s, current_card)
    guess =  @guesses.last
    check_guess(guess)
    @card_position += 1
  end

  def percent_correct
    (@number_correct.to_f / deck.count * 100).to_i
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards"
    delay_output(1)
    puts "---------------------------------"
    delay_output(1)
    start_game
    puts "******* Game over! *******"
    delay_output(1)
    puts "You had #{@number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}"
  end

  def start_game
    deck.cards.each do |card|
      puts "This is card number #{@card_position + 1} out of #{deck.count}"
      delay_output(1)
      puts "Question: #{card.question}"
      record_guess(input)
      puts "#{guesses.last.feedback}"
      delay_output(1)
      end
  end

  def input
    # More on why I do this with the mocks and stubs lesson
    gets.chomp
  end

end
