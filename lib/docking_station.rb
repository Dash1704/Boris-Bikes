require_relative "bike"

class DockingStation
  attr_reader :capacity
  attr_reader :bike
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    # @working_bikes = []
    # @broken_bikes = []
    @capacity = capacity
  end

  

  def release_bike
    # fail "No bikes available" if empty?
    # bike = @bikes.pop
    # fail "Bike is broken" if bike.working? == false
    if empty?
      fail "No bikes available"
    elsif  
      bike = @bikes.pop
      if bike.working? == false
        fail "Bike is broken"
      else
        bike
      end
    end
  end

  def dock(bike)
    fail "Docking station full" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.count == 0
  end

end
