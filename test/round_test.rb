require 'minitest/autorun'
require 'minitest/pride'
require "./lib/guess"
require './lib/card'
require './lib/deck'
require "./lib/round"

class RoundTest < Minitest::Test

  def test_round_holds_and_has_access_to_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal 2, round.deck.cards.length
    assert_equal [], round.guesses
    assert_equal "What is the capital of Alaska?", round.current_card.question
    assert_equal "Juneau", round.current_card.answer
  end

  def test_record_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
    assert_equal 'Correct!', round.guesses.first.feedback
    assert_equal 1, round.number_correct
    assert_equal card_2, round.current_card

    round.record_guess("2")
    assert_equal 2, round.guesses.count
    assert_equal 'Incorrect.', round.guesses.last.feedback
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end

end
