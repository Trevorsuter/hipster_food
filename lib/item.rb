class Item
  attr_reader :name, :price

  def initialize(data)
    @name = data[:name]
    @price = (data[:price].delete "$, .").to_i * 0.01
  end
end