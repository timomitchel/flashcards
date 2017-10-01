class CardGenerator

  def initialize(filename)
    @filename = filename
  end

  def loader
    File.open(@filename).readlines.map do |line|
      question, answer = line.strip!.split(",")
        Card.new(question, answer)
    end
  end
  
end
