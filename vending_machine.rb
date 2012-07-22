class VendingMachine
  attr_accessor :moneys

  def initialize
    @moneys = {:yen10 => 0, :yen50 => 0, :yen100 => 0, :yen500 => 0, :yen1000 => 0}
    @money_to_value = {:yen10 => 10, :yen50 => 50, :yen100 => 100, :yen500 => 500, :yen1000 => 1000}
  end

  def add(yen)
    @moneys[yen] += 1
  end

  def calc_total
    total = 0
    @moneys.each do |money, count| 
      total += @money_to_value[money] * count
    end
    total
  end
end
