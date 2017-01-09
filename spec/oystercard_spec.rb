require "oystercard"
require "pry"

describe OysterCard do
  context "when initialized" do
    it "has a balance" do
      expect(subject.balance).to eq 0
    end
  end
  describe ".top_up(amount)" do
    context "when adding money" do
      before do
        @top_up = rand(50)
        subject.top_up(@top_up)
      end
      it "can have balance increase" do
        expect(subject.balance).to eq @top_up
      end
    end
    context "when exceeding maximum limit" do
      before do
        @max_capacity = OysterCard::MAX_CAPACITY
        subject.top_up(@max_capacity)
      end
      it "raises 'Maximum limit reached' error" do
        expect{subject.top_up(rand(10))}.to raise_error("Maximum limit of #{@max_capacity} reached")
      end
    end
  end
  describe '.deduct(amount)' do
    context 'when there is enough balance' do
      before do
        @top_up = rand(50)
        subject.top_up(@top_up)
        @fare = rand(5)
        subject.deduct(@fare)
      end
      it "can have balance decreased" do
        expect(subject.balance).to eq (@top_up - @fare)
      end
    end
  end
end
