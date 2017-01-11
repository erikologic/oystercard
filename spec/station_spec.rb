require "station"
describe Station do
  subject(:station) { described_class.new("Picadilly Circus", 1) }

  it {is_expected.to respond_to(:name)}
  it {is_expected.to respond_to(:zone)}

  describe "#initialize" do
    it {expect(described_class).to respond_to(:new).with(2).argument}

    context "when passed initialize arguments" do
      it "stores name" do
          expect(station.name).to eq("Picadilly Circus")
      end
      it "stores zone" do
          expect(station.zone).to eq(1)
      end
    end
  end
end
