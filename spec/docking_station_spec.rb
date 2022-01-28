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
  end

describe "#dock" do 
  it 'docks a bike at a station' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raises an error if docks full' do
    20.times {subject.dock Bike.new}
    expect {subject.dock Bike.new}.to raise_error "Docking station full"
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




