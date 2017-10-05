require 'minitest/autorun'
require 'minitest/pride'
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
    assert_equal 'juneau', card.answer
  end

end
