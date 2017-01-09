require "oystercard"

describe Oystercard do
  context "when initialized" do
    it "has a balance" do
      expect(subject.balance).to eq 0
    end
  end
end
