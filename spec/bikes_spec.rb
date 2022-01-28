require "docking_station"

describe Bike do
  describe "#working?" do
    it {is_expected.to respond_to :working?}
  end

  describe "#report" do
    it {is_expected.to respond_to :report}

    it "should be broken" do
      subject.report
      expect(subject.working?).to eq false 
    end

  end

end
