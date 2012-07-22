class Juice
  attr_accessor :name, :price

  def initialize(name, price)
    @name, @price = name, price
  end

  def ==(other)
    @name == other.name && @price == other.price
  end
end
