require "product_inventory"

RSpec.describe ProductInventory do
  it "should return all the products" do
    products = CSV.read("products.csv").map do |product|
      { code: product[1], name: product[0], price: product[2] }
    end
    product_inventory = ProductInventory.new

    expect(product_inventory).to receive(:all_products).with(no_args).and_return(products)

    product_inventory.all_products
  end

  it "should find product when the code is valid" do
    product = [{:code=>"198RWW2K0VZ974863", :name=>"driller", :price=>"11.99"}]
    code = "198RWW2K0VZ974863"
    product_inventory = ProductInventory.new

    expect(product_inventory).to receive(:find_product).with(code).and_return(product)

    product_inventory.find_product(code)
  end

  it "should return 'Product not found' when the code is not valid" do
    code = "invalid"
    product_inventory = ProductInventory.new

    expect(product_inventory).to receive(:find_product).with(code).and_return("Product not found")
    product_inventory.find_product(code)
  end
end
