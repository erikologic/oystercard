class OysterCard
  attr_reader :balance
  MAX_CAPACITY = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Maximum limit of #{MAX_CAPACITY} reached" if @balance + value > MAX_CAPACITY
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
