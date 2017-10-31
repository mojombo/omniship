require 'spec_helper'

describe "Newgistics::Track" do
  it 'invalid tracking' do 
    expect { Omniship::Newgistics.track(NEWGISTICS_INVALID_ID) }.to raise_error(Omniship::Newgistics::Track::Error)
  end

  # newgistics test data is essentially random so we can't test for shipped/arrived packages. But we can test that things are formatted at least 

  it 'valid shipment' do 
    skip "I no longer have valid test api credentials"
    trk = Omniship::Newgistics.track(NEWGISTICS_VALID_ID)

    expect(trk.shipment).to_not be_nil
    expect(trk.shipment.packages.count).to_not eq(0)

    trk.shipment.packages.each do |package|
      expect(package.tracking_number).to eq(NEWGISTICS_VALID_ID)
      expect(package.has_left?).to_not be_nil
      expect(package.has_arrived?).to_not be_nil

      package.activity.each do |activity|
        expect(activity.status).to_not be_nil
        expect(activity.code).to_not be_nil
        expect(activity.timestamp).to_not be_nil
        expect(activity.address).to_not be_nil
      end
    end
  end

  it 'timestamp parsing' do 
    date = "\/Date(1469163600000-0500)\/" 
    time = "\/Date(1484870400000-0600)\/"
    expect(Omniship::Newgistics.parse_timestamp(date, time).utc).to eq(Time.parse("2016-7-22 18:00 CST").utc)
  end

  it 'test xml parsing' do 
    trk = Omniship::Newgistics::Track::Response.new(JSON.parse(track_newgistics_response))
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq true
    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery).to be_nil
    activity = package.activity.first
    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.address.to_s).to eq("Milwaukee, WI 53204")
    expect(activity.timestamp).to_not be_nil
  end

  it 'test xml parsing not found' do 
    error = Omniship::Newgistics::Track::Error.new(JSON.parse(track_newgistics_not_found_response)["Packages"].first)
    expect(error.code).to eq(Omniship::TrackError::NOT_FOUND)
  end
end

