require './vending_machine'

describe VendingMachine do
  subject { VendingMachine.new }

  describe '#add' do
    it 'add yen10' do
      subject.add(:yen10)
      subject.moneys.should include(:yen10)
    end

    it 'add yen50' do
      subject.add(:yen50)
      subject.moneys.should include(:yen50)
    end

    it 'add yen100' do
      subject.add(:yen100)
      subject.moneys.should include(:yen100)
    end

    it 'add yen500' do
      subject.add(:yen500)
      subject.moneys.should include(:yen500)
    end

    it 'add yen1000' do
      subject.add(:yen1000)
      subject.moneys.should include(:yen1000)
    end

    it 'add yen10 and yen100' do
      subject.add(:yen10)
      subject.add(:yen100)
      subject.moneys[:yen10].should == 1
      subject.moneys[:yen100].should == 1
    end

    it 'add yen10 and yen10' do
      subject.add(:yen10)
      subject.add(:yen10)
      subject.moneys[:yen10].should == 2
    end
  end
end
