class VendingMachine
  attr_accessor :moneys

  def initialize
    @moneys = []
  end

  def add(yen)
    @moneys << yen
  end
end
