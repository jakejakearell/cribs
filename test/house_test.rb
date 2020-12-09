require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')

  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_it_has_attributes
    assert_equal 400000, @house.price

    assert_equal "123 sugar lane", @house.address

  end

  def test_it_can_add_rooms
    assert_equal [],@house.rooms

    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_can_tell_if_house_above_market_average
    assert_equal false, @house.above_market_average?

  end

  def test_sorting_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_2, @room_2], @house.rooms_from_category(:bedroom)

    assert_equal [@room_4], @house.rooms_from_category(:basement)


    assert_equal 1900, @house.area

    # assert_equal {"price" => 400000, "address" => "123 sugar lane"}, @house.details

  end
end
