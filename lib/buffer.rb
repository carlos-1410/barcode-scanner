class Buffer
  def initialize
    @items = Array.new
  end

  def push(data)
    @items.push(data)
  end

  def all_items
    @items
  end
end
