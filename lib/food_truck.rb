class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new
  end

  def stock(item, amt)
    inventory[item] = amt
  end

  def check_stock(item)
    if inventory.include?(item) == false
      0
    else inventory[item]
    end
  end
end