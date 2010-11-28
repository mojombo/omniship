require File.dirname(__FILE__) + '/helper'

class TestUPSTrack < Test::Unit::TestCase
  context "stuff" do
    setup do

    end

    should "work" do
      tr = OmniShip::UPS.track('1z7900970327439305')

      tr.shipment.packages.first.activity.each do |act|
        p act.location.address.to_s
      end

      puts tr.shipment.packages.first.activity_map_url

      p tr.to_json
    end
  end
end
