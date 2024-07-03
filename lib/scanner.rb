require_relative "buffer"
require_relative "lcd_display"
require_relative "product_inventory"

class Scanner
  def initialize(buffer)
    @buffer = buffer
  end

  def call(code)
    product = find_product(code)
    add_product(product)
    show_product(product)
  end

  private

  attr_reader :buffer

  def find_product(code)
    ProductInventory.new.find_product(code)
  end

  def show_product(product)
    input = product.is_a?(Object) ? product.to_s : product

    LCDDisplay.call(input)
  end

  def add_product(product)
    buffer.push(product)
  end
end
