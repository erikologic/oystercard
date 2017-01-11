class OysterCard
  attr_reader :balance, :entry_station, :journeys
  MAX_CAPACITY = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(value)
    raise "Maximum limit of #{MAX_CAPACITY} reached" if @balance + value > MAX_CAPACITY
    @balance += value
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    raise("Not enough balance") if @balance < MIN_FARE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    journeys << {start_station: @entry_station, end_station: exit_station}
    deduct(MIN_FARE)
    @entry_station = nil
  end

  private

  def deduct(value)
    @balance -= value
  end

end
