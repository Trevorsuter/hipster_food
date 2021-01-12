require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/item'
require './lib/food_truck'
require './lib/event'

class EventTest < MiniTest::Test

  def setup
    @event = Event.new("South Pearl Street Farmers Market")
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item2, 30)
    @food_truck2.stock(@item3, 15)
    @food_truck2.stock(@item4, 10)
  end

  def test_it_exists
    assert_instance_of Event, @event
    assert_equal "South Pearl Street Farmers Market", @event.name
    assert_equal [], @event.food_trucks
  end

  def test_add_food_truck
    @event.add_food_truck(@food_truck)
    assert_equal [@food_truck], @event.food_trucks
  end

  def test_food_truck_names
    @event.add_food_truck(@food_truck)
    assert_equal ["Rocky Mountain Pies"], @event.food_truck_names
  end

  def test_trucks_that_sell
    @event.add_food_truck(@food_truck)
    @event.add_food_truck(@food_truck2)
    assert_equal [@food_truck], @event.trucks_that_sell(@item1)
    assert_equal [@food_truck2], @event.trucks_that_sell(@item3)
  end

  def test_sorted_item_list
    @event.add_food_truck(@food_truck)
    @event.add_food_truck(@food_truck2)
    assert_equal [@item2.name, @item4.name, @item1.name, @item3.name], @event.sorted_item_list
  end

  def test_total_inventory
    @event.add_food_truck(@food_truck)
    @event.add_food_truck(@food_truck2)
    assert_equal 4, @event.total_inventory.keys.length
    assert_equal 2,
  end
end