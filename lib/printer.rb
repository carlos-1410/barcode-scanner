require_relative "lcd_display"
require_relative "product"

class Printer
  def initialize(buffer)
    @buffer = buffer
  end

  attr_reader :buffer

  def call
    sum = LCDDisplay.call(total_sum)
    total_sum_text = "\n---------\nTOTAL: #{sum.round(2)}"

    products_info.concat(total_sum_text)
  end

  def products_info
    @products_info = buffer.items.map { _1.to_s }.join("\n")
  end

  def total_sum
    @total_sum ||= buffer.items.sum { _1.price }
  end
end
