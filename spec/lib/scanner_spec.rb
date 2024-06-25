require "buffer"
require "product_inventory"
require "scanner"

RSpec.describe Scanner do
  it "should find, add and show a product when the code is valid" do
    code = "198RWW2K0VZ974863"
    buffer = Buffer.new
    scanner = Scanner.new(buffer)
    product = find_product(code)
    
    buffer.push(product)
    expect(buffer.all_items).to include(product)

    expect(scanner).to receive(:call).with(code)
    scanner.call(code)
  end

  it "should find, add and show many products when the code is valid" do
    first_code = "198RWW2K0VZ974863"
    second_code = "167492NY3C8648905"
    buffer = Buffer.new
    scanner = Scanner.new(buffer)
    first_product = find_product(first_code)
    second_product = find_product(second_code)

    buffer.push(first_product)
    buffer.push(second_product)
    expect(buffer.all_items).to include(first_product, second_product)
    
    expect(scanner).to receive(:call).with(code: first_code)
    expect(scanner).to receive(:call).with(code: second_code)
    scanner.call(code: first_code)
    scanner.call(code: second_code)
  end

  it "should show 'Product not found' when the code is not valid" do
    code = "invalid"
    expected_output = "Product not found"
    buffer = Buffer.new
    scanner = Scanner.new(buffer)
    not_found_product = find_product(code)

    buffer.push(not_found_product)
    expect(buffer.all_items).to include(expected_output)

    expect(scanner).to receive(:call).with(code)
    scanner.call(code)
  end

  private

  def find_product(code)
    ProductInventory.new.find_product(code)
  end
end
