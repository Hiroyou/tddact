require './vending_machine'

describe VendingMachine do
  describe '#add' do
    it 'add yen100' do
      vm = VendingMachine.new
      vm.add(:yen100)
      vm.moneys.should include(:yen100)
    end
  end
end
