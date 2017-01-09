class OysterCard
  attr_reader :balance
  MAX_CAPACITY = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise "Maximum limit of #{MAX_CAPACITY} reached" if @balance + value > MAX_CAPACITY
    @balance += value
  end

end
