# -*- encoding: utf-8 -*-
require './vending_machine'
require './juice'

describe VendingMachine do
  subject { VendingMachine.new }

  before do
    @cola = Juice.new("コーラ", 120)
  end

  describe '#add' do
    context 'お金1枚入れた時' do
      where(:money) do
        [
          [:yen10],
          [:yen50],
          [:yen100],
          [:yen500],
          [:yen1000],
        ]
      end

      with_them do
        before do
          subject.add(money)
        end

        it do
          subject.moneys[money].should == 1
        end
      end
    end

    context 'お金を複数入れた時' do
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

    context '扱えないお金を入れられた時' do
      it 'yen5を入れられたらyen5が払い戻される' do
        subject.add(:yen5).should == :yen5
      end
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

    context '何も購入しない' do
      it "つり銭を出力する" do
        subject.refund.should == 250
      end
    end

    context 'コーラを購入したあと' do
      it '釣り銭を出力する' do
        subject.refund.should == 130
      end
    end
  end

  describe "#initialize" do
    it "120円のコーラが5本入っている" do
      subject.juices.should == Array.new(5, @cola)
    end
  end

  describe '#can_buy' do
    context '投入金額と在庫から購入可能か判定できる' do
      it '100円投入して、コーラが買えない' do
        subject.add(:yen100)
        subject.should_not be_can_buy
      end

      it '120円投入して、コーラが買える' do
        subject.add(:yen100)
        subject.add(:yen10)
        subject.add(:yen10)
        subject.should be_can_buy
      end
    end
  end

  describe "#buy" do
    context "お金が足りる場合" do
      before do
        subject.add(:yen100)
        subject.add(:yen10)
        subject.add(:yen10)
      end

      it "在庫が減って売上が増える" do
        subject.buy

        subject.juices.should == Array.new(4, @cola)
        subject.sales.should == 120
      end
    end

    context "お金が足りない場合" do
      before do
        subject.add(:yen100)
        subject.add(:yen10)
      end

      it "在庫が減らず売上も増えない" do
        subject.buy

        subject.juices.should == Array.new(5, @cola)
        subject.sales.should == 0
      end
    end
  end
end
