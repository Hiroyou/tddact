require './vending_machine'

describe VendingMachine do
  subject { VendingMachine.new }

  describe '#add' do
    it 'add yen10' do
      subject.add(:yen10)
      subject.moneys[:yen10].should == 1
    end

    it 'add yen50' do
      subject.add(:yen50)
      subject.moneys[:yen50].should == 1
    end

    it 'add yen100' do
      subject.add(:yen100)
      subject.moneys[:yen100].should == 1
    end

    it 'add yen500' do
      subject.add(:yen500)
      subject.moneys[:yen500].should == 1
    end

    it 'add yen1000' do
      subject.add(:yen1000)
      subject.moneys[:yen1000].should == 1
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