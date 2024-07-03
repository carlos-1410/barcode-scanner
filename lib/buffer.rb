class Buffer
  def initialize
    @items = Array.new
  end

  def push(data)
    @items.push(data)
  end

  def items
    @items
  end
end
