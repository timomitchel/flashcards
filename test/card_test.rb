require 'pry'
require 'minitest/autorun'
require "./lib/guess"
require './lib/card'
require './lib/deck'
require "./lib/round"

class CardTest < Minitest::Test

  def test_card_class_exists
    card = Card.new("What is the capital of Alaska?", 'Juneau')
    assert_instance_of Card, card
  end

  def test_question_and_answer_are_returned_corectly
    card = Card.new("What is the capital of Alaska?", 'Juneau')

    assert_equal "What is the capital of Alaska?", card.question
    assert_equal 'Juneau', card.answer
  end

  def test_guess_returns_correct_feedback_and_boolean_for_correct_guesses
    card = Card.new("What is the capital of Alaska?", 'Juneau')
    guess = Guess.new("Juneau", card)

    assert_equal card, guess.card
    assert_equal true, guess.correct?
    assert_equal 'Correct!', guess.feedback
  end

  def test_guess_returns_correct_feedback_and_boolean_for_incorrect_guesses
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal card, guess.card
    assert_equal false, guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end

  def test_cards_can_get_stored_in_a_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])

    assert_instance_of Array, deck.cards
    assert_equal 3, deck.count
  end

  def test_round_holds_and_has_access_to_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.deck
  end

end
