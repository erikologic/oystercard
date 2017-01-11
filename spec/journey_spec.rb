require 'journey'

describe Journey do

  let(:start_station){double("Station")}
  let(:end_station){double("Station")}

  subject(:journey) { described_class.new(start_station) }

  it {is_expected.to respond_to(:start_station)}
  it {is_expected.to respond_to(:end_station)}
  it {is_expected.to respond_to(:fare)}
  it {is_expected.to respond_to(:complete?)}

  context 'when journey start' do
    it 'stores a start station' do
      expect(journey.start_station).to eq(start_station)
    end
    context 'and it ends' do
      before do
        journey.end_station = end_station
      end
      it 'stores the end station' do
        expect(journey.end_station).to eq(end_station)
      end
      it 'calculates fare' do
        expect{journey.calc_fare}.to change{journey.fare}.to(1)
      end
    end
    context 'and it doesn\'t end' do
      xit "calculates a fare with a penalty" do
        expect{journey.calc_fare}.to change(journey.fare).to(6)
      end
    end
  end
  context 'when a journey doesn\'t start' do
    context 'and it ends' do
      xit "calculates a fare with a penalty" do
        expect{journey.calc_fare}.to change(journey.fare).to(6)
      end
    end
    context 'and it doesn\'t end' do
      it '?????????????' do

      end
    end
  end
end
