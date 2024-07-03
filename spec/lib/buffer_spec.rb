require "buffer"
require "product_inventory"

RSpec.describe Buffer do
  it "should display one product" do
    product = find_product("198RWW2K0VZ974863")

    buffer.push(product)

    expect(buffer.items).to include(product)
  end

  it "should display all pushed products" do
    first_product = find_product("198RWW2K0VZ974863")
    second_product = find_product("19974XJ39L1835013")    

    buffer.push(first_product)
    buffer.push(second_product)

    expect(buffer.items).to include(first_product, second_product)
  end

  private

  def buffer
    @buffer ||= Buffer.new
  end

  def find_product(code)
    ProductInventory.new.find_product(code)
  end
end
