require "ostruct"

class Product
  def initialize(data)
    @product = OpenStruct.new(
      name: data.fetch(:name, nil),
      price: data.fetch(:price, nil)&.to_f
    )
  end

  attr_reader :product, :name, :price

  def to_s
    "NAME: #{product.name} | PRICE: #{product.price}"
  end

  def name
    product.name
  end

  def price
    product.price
  end
end
