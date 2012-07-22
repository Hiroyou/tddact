require './vending_machine'

describe VendingMachine do
  describe '#add' do
    it 'add yen100' do
      vm = VendingMachine.new
      vm.add(:yen100)
      vm.moneys.include?(:yen100).should be_true
    end
  end
end
