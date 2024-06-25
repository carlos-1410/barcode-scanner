class LCDDisplay
  def initialize(input)
    @input = input
  end

  attr_reader :input

  def call
    input
  end
end
