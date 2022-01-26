require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike = Bike.new
    #Below is because we want to return the bike we dock
    expect(subject.dock(bike)).to eq bike
  end
  
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    #below because we need to return the bike we just docked
    expect(subject.bike).to eq bike
  end


end