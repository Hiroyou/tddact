class VendingMachine
  attr_accessor :moneys

  def initialize
    @moneys = {:yen10 => 0, :yen50 => 0, :yen100 => 0, :yen500 => 0, :yen1000 => 0}
  end

  def add(yen)
    @moneys[yen] += 1
  end

  def calc_total
    total = 0
    total += @moneys[:yen10] * 10
    total += @moneys[:yen50] * 50
    total += @moneys[:yen100] * 100
    total += @moneys[:yen500] * 500
    total += @moneys[:yen1000] * 1000
    total
  end
end
