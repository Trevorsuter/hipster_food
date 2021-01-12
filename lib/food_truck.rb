class FoodTruck
  attr_reader :name, :inventory, :items

  def initialize(name)
    @name = name
    @inventory = Hash.new
    @items = []
  end

  def stock(item, amt)
    inventory[item] = amt
    items << item
  end

  def check_stock(item)
    if inventory.include?(item) == false
      0
    else inventory[item]
    end
  end

  def potential_revenue
    revenue = 0 
    inventory.each do |item, value|
      revenue += item.price * value
    end
    revenue
  end

  def item_names
    items = inventory.map do |key, value|
      key.name
    end
    items.sort!
  end
end