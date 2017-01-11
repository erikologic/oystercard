require 'journey'

describe Journey do

  subject(:journey) { described_class.new }

  it {is_expected.to respond_to(:start)}
  it {is_expected.to respond_to(:finish)}
  it {is_expected.to respond_to(:fare)}
  it {is_expected.to respond_to(:complete?)}


end
