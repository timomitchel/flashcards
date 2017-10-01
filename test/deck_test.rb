require 'minitest/autorun'
require 'minitest/pride'
require "./lib/guess"
require './lib/card'
require './lib/deck'
require "./lib/round"


class DeckTest < Minitest::Test

  def test_cards_can_get_stored_in_a_deck_and_return_count
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])

    assert_instance_of Array, deck.cards
    assert_equal 3, deck.count
  end

end
