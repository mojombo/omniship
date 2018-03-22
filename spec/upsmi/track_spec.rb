require 'spec_helper'

describe "UPSMI::Track" do
  it 'invalid tracking' do 
    expect { Omniship::UPSMI.track(UPSMI_TEST_NUMBER)  }.to_not raise_error(Omniship::TrackError)
    expect { Omniship::UPSMI.track(UPS_INVALID_TEST_NUMBER)  }.to raise_error(Omniship::TrackError)
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
  end
  
  it 'test xml parsing not found' do 
    error = Omniship::UPS::Track::Error.new(Nokogiri::XML::Document.parse(track_ups_mi_not_found_response))
    expect(error.code).to eq(Omniship::TrackError::NOT_FOUND)
  end

end

