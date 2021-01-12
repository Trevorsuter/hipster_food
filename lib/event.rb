class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    food_trucks << truck
  end
  
  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck if truck.check_stock(item) != 0
    end
  end

  def sorted_item_list
    list = @food_trucks.map do |truck|
      truck.item_names
    end
    list.flatten!.sort
  end

  def total_inventory
    total_inv = Hash.new
    value = Hash.new
    @food_trucks.each do |truck|
      truck.items.each do |item|
        total_inv[item] = value
      end
    end
    @food_trucks.each do |truck|
      total_inv.keys.each do |item|
      value[:quantity] = truck.check_stock(item)
      end
    end
    total_inv.keys.each do |item|
      value[:trucks] = trucks_that_sell(item)
    end
    require 'pry'; binding.pry
    total_inv
  end
end