require "oystercard"

describe OysterCard do
  context "when initialized" do
    it "has a balance" do
      expect(subject.balance).to eq 0
    end
  end
  context "when adding money" do
    before do
      @topup = rand(50)
      subject.topup(@topup)
    end
    it "has balanced increased by #{@topup}" do
      expect(subject.balance).to eq @topup
    end
  end
end
