require 'pry'
require 'minitest/autorun'
require "./lib/guess"
require './lib/card'

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
end
