require "buffer"
require "product_inventory"
require "scanner"

RSpec.describe Scanner do
  it "should find, add and show a product when the code is valid" do
    code = "198RWW2K0VZ974863"
    scanner = Scanner.new(buffer)
    product = find_product(code)
    
    buffer.push(product)
    expect(buffer.items).to include(product)

    expect(scanner).to receive(:call).with(code).and_return(product.to_s)
    scanner.call(code)
  end

  it "should find, add and show many products when the code is valid" do
    first_code = "198RWW2K0VZ974863"
    second_code = "167492NY3C8648905"
    scanner = Scanner.new(buffer)
    first_product = find_product(first_code)
    second_product = find_product(second_code)

    buffer.push(first_product)
    buffer.push(second_product)
    expect(buffer.items).to include(first_product, second_product)
    
    expect(scanner).to receive(:call).with(code: first_code).and_return(first_product.to_s)
    expect(scanner).to receive(:call).with(code: second_code).and_return(second_product.to_s)

    scanner.call(code: first_code)
    scanner.call(code: second_code)
  end

  it "should show 'Product not found' when the code is not valid" do
    code = "invalid"
    expected_output = "Product not found"
    scanner = Scanner.new(buffer)
    not_found_product = find_product(code)

    buffer.push(not_found_product)
    expect(buffer.items).to include(expected_output)

    expect(scanner).to receive(:call).with(code).and_return(expected_output)
    scanner.call(code)
  end

  private

  def buffer
    @buffer ||= Buffer.new
  end

  def find_product(code)
    ProductInventory.new.find_product(code)
  end
end
