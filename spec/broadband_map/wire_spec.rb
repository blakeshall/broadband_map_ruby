require 'helper'

describe BroadbandMap::Client::Wire do

  before do
    @client = BroadbandMap::Client.new
  end

  describe ".wireless" do
    before do
      stub_get("broadband/fall2010/wireless?latitude=42.456&longitude=-74.987&format=json&maxresults=100&callback=").
        to_return(:status => 200, :body => fixture("wireless.json"))
    end

    it "should return correct item" do
      test = @client.wireless({:data_version => 'fall2010', :latitude => 42.456, :longitude => -74.987})
      a_get("broadband/fall2010/wireless?latitude=42.456&longitude=-74.987&format=json&maxresults=100&callback=").should have_been_made
      test.results.wirelessServices[0].frn.should == "0003774593"
    end
  end

  describe ".wireline" do
    before do
      stub_get("broadband/fall2010/wireline?latitude=42.456&longitude=-74.987&format=json&maxresults=100&callback=").
        to_return(:status => 200, :body => fixture("wireline.json"))
    end

    it "should return correct item" do
      test = @client.wireline({:data_version => 'fall2010', :latitude => 42.456, :longitude => -74.987})
      a_get("broadband/fall2010/wireline?latitude=42.456&longitude=-74.987&format=json&maxresults=100&callback=").should have_been_made
      test.results.wirelineServices[0].blockFIPS.should == "360779908001025"
    end
  end
end
