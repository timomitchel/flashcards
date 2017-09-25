require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashcardRunner

  card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  deck = Deck.new([card_1, card_2])
  round = Round.new(deck)

  round.start



end
