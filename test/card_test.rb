require 'minitest/autorun'
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

  def test_guess
    card = Card.new("What is the capital of Alaska?", 'Juneau')
    guess = Guess.new("Jeneau", card)

    assert_equal '', guess.card
    assert_equal true, guess.correct?
    assert_equal 'Correct!', guess.feedback
  end
end
