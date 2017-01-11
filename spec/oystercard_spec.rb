require "oystercard"
require "pry"

describe OysterCard do
  subject(:oystercard) { described_class.new }

  #  before do
  #    @station = double("Station")
  #  end

  let(:station) {double("Station")}
  it { is_expected.to respond_to(:journeys)}

  context "when initialized" do
    it "has a balance" do
      expect(oystercard.balance).to eq 0
    end
    it "journeys is an empty array" do
      expect(oystercard.journeys).to eq([])
    end
  end

  describe "#entry_station" do
    it {is_expected.to respond_to(:entry_station)}
  end

  describe '#top_up(amount)' do
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
        expect{oystercard.top_up(rand(10)+1)}.to raise_error("Maximum limit of #{@max_capacity} reached")
      end
    end
  end

=begin
  describe '#deduct(amount)' do
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
=end

  describe '#in_journey?' do
    it "is initially not in journey" do
      expect(oystercard).not_to be_in_journey
    end
  end

  describe '#touch_in(station)' do
    it { is_expected.to respond_to(:touch_in).with(1).argument}
    context 'when minimum balance is above the minimum fare' do
      before do
        min_fare = described_class::MIN_FARE
        oystercard.top_up(min_fare + 1)
      end
      it "stores the entry station" do
        expect{oystercard.touch_in(station)}.to change{oystercard.entry_station}.to(station)
      end
      it "changes the state of in_journey? to true" do
        expect{oystercard.touch_in(station)}.to change{oystercard.in_journey?}.from(false).to(true)
      end
    end
    context 'when minimum balance is below the minimum farew' do
      it 'raise a "Not enough balance" error' do
        expect{oystercard.touch_in(station)}.to raise_error("Not enough balance")
      end
    end
  end

  describe '#touch_out' do
    before do
        @min_fare = described_class::MIN_FARE
        oystercard.top_up(@min_fare * 2)
        oystercard.touch_in(station)
    end
    context 'when finishing a journey' do
      it "changes the state of in_journey? to false" do
        expect{oystercard.touch_out}.to change{oystercard.in_journey?}.from(true).to(false)
      end
      it "reduces the balance by minimum fare" do
        expect{oystercard.touch_out}.to change{oystercard.balance}.by(-@min_fare)
      end
      it " resets the entry station to nil" do
        expect{oystercard.touch_out}.to change{oystercard.entry_station}.to(nil)
      end
    end
  end
end
