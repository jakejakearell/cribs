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

  def price_per_square_foot
    ppsf = price / (area * 1.00)

    ppsf.round(2)
  end

  def rooms_sorted_by_area
    area =[]

    @rooms.each do |room|

      if area == []
        area << room
      elsif room.area > area[0].area
        area.unshift(room)
      else
        area.push(room)
      end

    end

    area

  end

  def rooms_by_category
    category = Hash.new
    types = []

    @rooms.each do |room|
      types << room.category
    end

    types = types.uniq
    rooms = []
    types.each do |type|
      rooms = Array.new(3){ rooms_from_category(type)}
    end


    @rooms.each do |room|
      category[room.category] = [room]
    end

    category

    # rooms.each do |room|
    #   category[]
    # end

  end

end
