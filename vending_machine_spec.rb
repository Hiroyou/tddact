require './vending_machine'

describe VendingMachine do
  describe '#add' do
    it 'add yen10' do
      vm = VendingMachine.new
      vm.add(:yen10)
      vm.moneys.should include(:yen10)
    end
    
		it 'add yen50' do
      vm = VendingMachine.new
      vm.add(:yen50)
      vm.moneys.should include(:yen50)
    end
    
		it 'add yen100' do
      vm = VendingMachine.new
      vm.add(:yen100)
      vm.moneys.should include(:yen100)
    end
    
		it 'add yen500' do
      vm = VendingMachine.new
      vm.add(:yen500)
      vm.moneys.should include(:yen500)
    end
		
		it 'add yen1000' do
      vm = VendingMachine.new
      vm.add(:yen1000)
      vm.moneys.should include(:yen1000)
    end
  end
end
