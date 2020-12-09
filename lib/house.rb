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

  def add_room(room)
    @rooms << room
  end

end
