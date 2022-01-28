require "docking_station"

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it {is_expected.to respond_to(:dock).with(1).argument}
  it {is_expected.to respond_to :bike}

  describe "#release_bike" do
    it "should give an error message" do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end

    it 'releases working bikes' do
      bike = Bike.new
      expect(bike).to be_working
    end


    it 'doesnt release broken bikes' do
      bike = Bike.new
      bike.report
      # expect(bike).not_to be_working 
      docking_station = DockingStation.new
      docking_station.dock(bike)
      expect {docking_station.release_bike}.to raise_error 'Bike is broken' 
    end
  end

describe "#dock" do 
  it 'docks a bike at a station' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raises an error if docks full' do
    #use :: before the constant to be able to reach it inside the class
    DockingStation::DEFAULT_CAPACITY.times {subject.dock Bike.new}

    expect {subject.dock Bike.new}.to raise_error "Docking station full"
  end

  # it "checks for a working bike" do
  #   bike = Bike.new
  #   expect(bike).to be_working
  # end

  # it "checks for a broken bike" do
  #   bike = Bike.new
  #   bike.report
  #   expect(subject.dock(bike)).to eq bike 
  # end

end
  
describe "#initialization" do
  it "has default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
  
  it 'capacity can be defined' do
    docking_station = DockingStation.new(10)
    10.times{ docking_station.dock Bike.new}
    expect {docking_station.dock Bike.new}.to raise_error "Docking station full"
  end
end

describe "#bike" do
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    #below because we need to return the bike we just docked
    expect(subject.release_bike).to eq bike
  end
end
end




