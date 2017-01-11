require "oystercard"
require "pry"

describe OysterCard do

  subject(:oystercard) { described_class.new }

  context "when initialized" do
    it "has a balance" do
      expect(oystercard.balance).to eq 0
    end
  end
  describe ".top_up(amount)" do
    context "when adding money" do
      before do
        @top_up = rand(50)
        oystercard.top_up(@top_up)
      end
      it "can have balance increase" do
        expect(oystercard.balance).to eq @top_up
      end
    end
    context "when exceeding maximum limit" do
      before do
        @max_capacity = OysterCard::MAX_CAPACITY
        oystercard.top_up(@max_capacity)
      end
      it "raises 'Maximum limit reached' error" do
        expect{oystercard.top_up(rand(10))}.to raise_error("Maximum limit of #{@max_capacity} reached")
      end
    end
  end
  describe '.deduct(amount)' do
    context 'when there is enough balance' do
      before do
        @top_up = rand(50)
        oystercard.top_up(@top_up)
        @fare = rand(5)
        oystercard.deduct(@fare)
      end
      it "can have balance decreased" do
        expect(oystercard.balance).to eq (@top_up - @fare)
      end
    end
  end
  describe '.in_journey?' do
    it "is initially not in journey" do
      expect(oystercard).not_to be_in_journey
    end
  end
  describe '.touch_in' do
    context 'when minimum balance is above the minimum fare' do
      before do
        min_fare = described_class::MIN_FARE
        oystercard.top_up(min_fare + 1)
        oystercard.touch_in
      end
      it "changes the state of in_journey? to true" do
        expect(oystercard).to be_in_journey
      end
    end
    context 'when minimum balance is below the minimum fare' do
      it 'raise a "Not enough balance" error' do
        expect{oystercard.touch_in}.to raise_error("Not enough balance")
      end
    end
  end
  describe '.touch_out' do
    context 'when finishing a journey' do
      before do
          min_fare = described_class::MIN_FARE
          oystercard.top_up(min_fare + 1)
          oystercard.touch_in
      end
      it "changes the state of in_journey? to false" do
        expect{oystercard.touch_out}.to change{oystercard.in_journey?}.from(true).to(false)
      end
    end
  end
end
