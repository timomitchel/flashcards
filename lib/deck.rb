class Deck

attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

end
