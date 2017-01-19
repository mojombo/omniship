require 'spec_helper'

describe "UPS::Track" do
  it 'invalid tracking' do 
    expect { Omniship::UPS.track(UPS_INVALID_TEST_NUMBER) }.to raise_error(Omniship::UPS::Track::Error)
  end
  it 'arrived shipment' do 
    trk = Omniship::UPS.track(UPS_VALID_TEST_NUMBER_DELIVERED)
    expect(trk.has_arrived?).to be true
  end

  it 'left shipment' do 
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
    expect(trk.shipment.packages.first.activity.first.address.to_s).to eq("SANTA CLARA, CA 95053 US")
    expect(trk.shipment.packages.first.activity.first.timestamp).to_not be_nil
  end
end

