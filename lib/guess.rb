
class Guess

  attr_reader :guess, :card, :feedback

  def initialize(guess, card)
    @guess = guess
    @card = card
    @response = guess
  end

  def correct?
    @guess == @card.answer
  end

  def feedback
    if correct?
      'Correct!'
    else
      'Incorrect.'
    end
  end
end
