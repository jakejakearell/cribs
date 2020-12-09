class House
  attr_reader :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    interger_price =@price.slice(1..-1)

    interger_price.to_i

  end

  def above_market_average?
    price > 500000
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(type)
    list = []

    @rooms.each do |room|
      if room.category == type
        list << room
      end
    end

    list

  end

  def area
    house_area = 0

    @rooms.each do |room|
      house_area += room.area
    end

    house_area

  end

  def details
    details = Hash.new

    details["price"] = price
    details['address'] = @address

    details
  end





end
