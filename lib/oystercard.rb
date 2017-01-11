class OysterCard
  attr_reader :balance, :entry_station
  MAX_CAPACITY = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise "Maximum limit of #{MAX_CAPACITY} reached" if @balance + value > MAX_CAPACITY
    @balance += value
  end

  def in_journey?
    @entry_station ? true : false
  end

  def touch_in(station)
    raise("Not enough balance") if @balance < MIN_FARE
    @entry_station = station
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
    @entry_station = nil
  end

  private

  def deduct(value)
    @balance -= value
  end

end
