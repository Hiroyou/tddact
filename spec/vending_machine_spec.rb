# -*- encoding: utf-8 -*-
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

  describe '#calc_total' do

    context 'お金1枚入れた時' do
      where(:money,:expected) do
        [
          [:yen10, 10],
          [:yen50, 50],
          [:yen100, 100],
          [:yen500, 500],
          [:yen1000, 1000]
        ]
      end

      with_them do
        before do
          subject.add(money)
        end

        it "その金額を返す" do
         subject.calc_total.should == expected
        end

      end
    end

    context 'お金を複数入れた時' do
      it '100円と500円を入れた時600円が返る' do
        subject.add(:yen100)
        subject.add(:yen500)
        subject.calc_total.should == 600
      end
    end
  end

  describe "#refund" do
    before do
      subject.add(:yen100)
      subject.add(:yen100)
      subject.add(:yen50)
    end

    it "つり銭を出力する" do
      subject.refund.should == [:yen100, :yen100, :yen50]
    end
  end
end
