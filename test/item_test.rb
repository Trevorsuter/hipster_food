require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require 'pry'
require './lib/item'

class ItemTest <MiniTest::Test
  
  def setup
    @item = Item.new({name: 'Peach Pie (Slice)', price: '$3.75'})
  end

  def test_it_exists_with_attributes
    assert_instance_of Item, @item
    assert_equal 'Peach Pie (Slice)', @item.name
    assert_equal 3.75, @item.price
  end
end