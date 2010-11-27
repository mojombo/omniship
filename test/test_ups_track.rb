require File.dirname(__FILE__) + '/helper'

class TestUPSTrack < Test::Unit::TestCase
  context "stuff" do
    setup do
      
    end

    should "work" do
      tr = OmniShip::UPS.track('1z7900970327439305')
      p tr.shipment.scheduled_delivery
    end
  end
end
