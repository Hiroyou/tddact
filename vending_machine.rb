class VendingMachine
  attr_accessor :moneys

  def initialize
    @moneys = {:yen10 => 0, :yen50 => 0, :yen100 => 0, :yen500 => 0, :yen1000 => 0}
  end

  def add(yen)
    @moneys[yen] += 1
  end
end
