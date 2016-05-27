require 'spec_helper'

describe "UPSMI::Track" do
  it 'invalid tracking' do 
    expect { OmniShip::UPSMI.track(UPSMI_TEST_NUMBER)  }.to_not raise_error
  end
end

