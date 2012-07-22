# -*- encoding: utf-8 -*-
require 'pry'

class VendingMachine
  attr_accessor :moneys, :juices, :sales

  def initialize
    @moneys = {:yen10 => 0, :yen50 => 0, :yen100 => 0, :yen500 => 0, :yen1000 => 0}

    cola = Juice.new("コーラ", 120)
    @juices = Array.new(5, cola)
    @sales = 0
  end

  def add(yen)
    return yen unless @moneys.keys.include?(yen)

    @moneys[yen] += 1
    return nil
  end

  def calc_total
    @moneys.inject(0) do |total, money|
      total += get_price(money[0]) * money[1]
    end
  end

  def refund
    calc_total
  end

  def can_buy?
    @juices.each do |juice|
      return true if juice.price <= calc_total
    end
    return false
  end

  def buy
    if can_buy?
      juice = @juices.shift
      @sales += juice.price
    end
  end

  private
  def get_price(symbol)
    l = symbol.length
    symbol.to_s[3..l].to_i
  end
end
