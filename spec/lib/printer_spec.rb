require "buffer"
require "printer"
require "product_inventory"

RSpec.describe Printer do
  it "should print all the products and total sum" do
    buffer = Buffer.new
    %w(198RWW2K0VZ974863 5799EMAFXP7102781 19974XJ39L1835013
       574KVZT94VE737564 4517AF2U5A7851400 167492NY3C8648905).each do |code|
        product = find_product(code)
        add_product(product, buffer: buffer)
      end
    printer = Printer.new(buffer)
    expected_sum = buffer.all_items.sum { _1.price }
    expect(printer).to receive(:call).with(no_args).and_return(expected_output)

    output = printer.call

    expect(printer.total_sum).to eq(expected_sum)
    expect(output).to eq(expected_output)
  end

  private

  def add_product(product, buffer:)
    buffer.push(product)
  end

  def find_product(code)
    ProductInventory.new.find_product(code)
  end

  def expected_output
    <<-TEXT
      NAME: driller | PRICE: 111.99
      NAME: hammer | PRICE: 5.99
      NAME: screwdriver | PRICE: 15.99
      NAME: soldering iron | PRICE: 33.99
      NAME: wooden stick | PRICE: 0.5
      NAME: kremowka | PRICE: 21.37
      ---------
      TOTAL: 189.83
    TEXT
  end
end
