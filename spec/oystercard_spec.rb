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
  describe '.in_journey?' do
    it "is initially not in journey" do
      expect(subject).not_to be_in_journey
    end
  end
  describe '.touch_in' do
    context 'when starting a journey' do
      it "changes the state of in_journey? to true" do
        subject.touch_in
        expect(subject).to be_in_journey
      end
    end
  end
  describe '.touch_out' do
    context 'when finishing a journey' do
      it "changes the state of in_journey? to false" do
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey
      end
    end
  end
end
