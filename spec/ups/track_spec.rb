require 'spec_helper'

describe "UPS::Track" do
  # TODO - switch all these tests to webmock and we're good
  it 'invalid tracking' do 
    skip "can't run on travis" if ENV["TRAVIS"]
    expect { Omniship::UPS.track(UPS_INVALID_TEST_NUMBER) }.to raise_error(Omniship::UPS::Track::Error)
  end
  it 'arrived shipment' do 
    skip "can't run on travis" if ENV["TRAVIS"]
    trk = Omniship::UPS.track(UPS_VALID_TEST_NUMBER_DELIVERED)
    expect(trk.has_arrived?).to be true
  end

  it 'left shipment' do 
    skip "can't run on travis" if ENV["TRAVIS"]
    trk = Omniship::UPS.track(UPS_VALID_TEST_NUMBER_ORIGIN_SCAN)
    expect(trk.has_arrived?).to be false
    expect(trk.has_left?).to be true
  end

  it 'timstamp parsing' do 
    expect(Omniship::UPS.parse_timestamp("20170117", "211600")).to eq(Time.parse("2017-01-17 21:16"))
  end

  it 'test xml parsing' do 
    trk = Omniship::UPS::Track::Response.new(Nokogiri::XML::Document.parse(track_ups_response))
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq true
    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery).to be_nil
    activity = package.activity.first
    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.address.to_s).to eq("SANTA CLARA, CA 95053 US")
    expect(activity.timestamp).to_not be_nil

    alternate_tracking = package.alternate_tracking
    expect(alternate_tracking).to_not be_nil
    expect(alternate_tracking.type).to_not be_nil
    expect(alternate_tracking.value).to_not be_nil
  end

  it 'test xml parsing not found' do 
    error = Omniship::UPS::Track::Error.new(Nokogiri::XML::Document.parse(track_ups_not_found_response))
    expect(error.code).to eq(Omniship::TrackError::NOT_FOUND)
  end
end

