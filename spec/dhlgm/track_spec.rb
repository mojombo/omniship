require 'spec_helper'

describe "DHLGM::Track" do
  it 'invalid tracking' do 
    expect { Omniship::DHLGM.track(UPS_INVALID_TEST_NUMBER) }.to raise_error(Omniship::DHLGM::Track::Error)
  end

  it 'timestamp parsing' do 
    date = "\/Date(1469163600000-0500)\/" 
    time = "\/Date(1484870400000-0600)\/"
    expect(Omniship::DHLGM.parse_timestamp('1/18/2017', '6:12 PM EST').utc).to eq(Time.parse("2017-01-18 18:12 EST").utc)
  end

  it 'test xml parsing' do 
    track_dhlgm_response

    trk = Omniship::DHLGM::Track::Response.new(Nokogiri::XML::Document.parse(track_dhlgm_response))
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq true
    expect(trk.shipment.packages.first.activity.first.address.to_s).to eq("Bronx, NY 10454 US")
    expect(trk.shipment.packages.first.activity.first.timestamp).to_not be_nil
  end
  # I could not find any valid test numbers. Should mock that out.
end

