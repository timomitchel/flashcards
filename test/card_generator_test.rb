require 'minitest/autorun'
require 'minitest/pride'
require "./lib/guess"
require './lib/card'
require './lib/deck'
require "./lib/round"
require "./lib/card_generator"

class CardGeneratorTest < Minitest::Test

  def test_loads_file_into_array_with_questions_and_answers
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).loader

    assert_instance_of Array, cards
    assert_equal 'What is 5 + 5?', cards.first.question
    assert_equal 'justin bieber', cards.last.answer
  end

end
