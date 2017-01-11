class Journey
  attr_reader :start_station
  attr_accessor :end_station

  def initialize(start_station)
    @start_station = start_station
  end

  def calc_fare
    fare = (!!start_station and !!end_station) ? 1 : 6
  end

  def complete?
  end

end
