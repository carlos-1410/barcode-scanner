require "product"
require "product_inventory"

RSpec.describe Product do
  it "shows the correct data" do
    product = ProductInventory.new.find_product("198RWW2K0VZ974863")
    expectation = "NAME: #{product.name} | PRICE: #{product.price}"

    expect(product.to_s).to eq(expectation)
    expect(product.name).to eq("driller")
    expect(product.price).to eq(111.99)
  end
end
