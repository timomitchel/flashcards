require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require "./lib/guess"
require './lib/card'
require './lib/deck'
require "./lib/round"
require "./lib/card_generator"

class CardGeneratorTest < Minitest::Test

  def test_loads_file_into_array
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename).loader

    assert_instance_of Array, cards
    assert_equal 'What is 5 + 5?', cards.first.question
    assert_equal 'Justin bieber', cards.last.answer
  end

end
