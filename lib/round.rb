class Round

  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

end
