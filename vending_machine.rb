require 'pry'

class VendingMachine
  attr_accessor :moneys

  def initialize
    @moneys = {:yen10 => 0, :yen50 => 0, :yen100 => 0, :yen500 => 0, :yen1000 => 0}
  end

  def add(yen)
    @moneys[yen] += 1
  end

  def calc_total
    @moneys.inject(0) do |total, money|
      total += get_price(money[0]) * money[1]
    end
  end

  def refund
    result = []
    @moneys.each { |money, count|
      count.times do
        result << money 
      end
    }
    result
  end

  private
  def get_price(symbol)
    l = symbol.length
    symbol.to_s[3..l].to_i
  end
end
