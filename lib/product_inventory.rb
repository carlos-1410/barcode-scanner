require "csv"
require "product"

class ProductInventory
  def initialize
    @products = CSV.read("products.csv").map do |product|
      { name: product[0], code: product[1], price: product[2] }
    end
  end

  attr_reader :products

  def find_product(code)
    product = products.detect { _1[:code] == code }
    product ? Product.new(product) : "Product not found"
  end
end
