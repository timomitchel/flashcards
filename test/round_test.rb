require 'minitest/autorun'
require 'minitest/pride'
require "./lib/guess"
require './lib/card'
require './lib/deck'
require "./lib/round"
require "./lib/guess"

class RoundTest < Minitest::Test

  def test_round_holds_and_has_access_to_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal 2, round.deck.cards.length
    assert_equal [], round.guesses
    assert_equal "What is the capital of Alaska?", round.current_card.question
    assert_equal "juneau", round.current_card.answer
  end

  def test_record_guess_can_count_and_give_current_card_and_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")

    assert_equal 1, round.guesses.count
    assert_equal 'Correct!', round.guesses.first.feedback
    assert_equal 1, round.number_correct
    assert_equal card_2, round.current_card
  end

  def test_record_guess_can_hold_two_guesses_correctly
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2,])
    round = Round.new(deck)

    round.record_guess("Juneau")
    round.record_guess("2")

    assert_equal 2, round.guesses.count
    assert_equal 'Incorrect.', round.guesses.last.feedback
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end

  def test_record_guess_edge_cases
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("Is Taylor Swift the best artist of our era?", "yes")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    edge = nil

    round.record_guess(5)
    round.record_guess('')
    round.record_guess(edge)

    assert_equal 0, round.percent_correct
    assert_equal 'yes', round.deck.cards[2].answer
    assert_nil nil, round.guesses.last.guess
    assert_equal 0, round.number_correct
  end

  def test_dynamic_sleep_ability
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    card_3 = Card.new("Is Taylor Swift the best artist of our era?", "yes")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal 1, round.delay_output(1)
    assert_equal 2, round.delay_output(2)
  end

  def test_check_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new('Juneau', round.current_card)

    assert_equal 1, round.check_guess(guess)
    assert_equal 1, round.number_correct

    round2 = Round.new(deck)
    guess2 = Guess.new('Anchorage', round2.current_card)

    assert_nil round2.check_guess(guess2)
    assert_equal 0, round2.number_correct
  end

end
