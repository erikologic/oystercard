class OysterCard
  attr_reader :balance
  MAX_CAPACITY = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    raise "Maximum limit of #{MAX_CAPACITY} reached" if @balance + value > MAX_CAPACITY
    @balance += value
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise("Not enough balance") if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  private

  def deduct(value)
    @balance -= value
  end

end
