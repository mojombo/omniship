module Omniship
  module Landmark
    module Track
      class Activity

=begin Landmark statuses
  
  const SHIPMENT_INFORMATION_RECEIVED = 50;           // Landmark has received order information
  const SHIPMENT_ALLOCATED = 60;                  // Order allocated and being picked, not yet processed
  const SHIPMENT_PROCESSED = 75;
  const SHIPMENT_FULFILLED = 80;                // Moved from "picked" to "shipped"
  const SHIPMENT_HELD_FOR_PAYMENT = 90;             // Shipment is at a Landmark facility waiting payment before sending
  const SHIPMENT_INFORMATION_TRANSMITTED_TO_CARRIER = 100;
  const CUSTOMS_CLEARED = 125;
  const CUSTOMS_VERIFIED = 130;
  const CROSSING_BORDER = 150;        // Entered into a Landmark crossing
  const CROSSING_RECEIVED = 155;        // Landmark Crossing marked as Received
  const ITEM_SCANNED_AT_POSTAL_FACILITY = 200;
  const ITEM_SCANNED_AT_FACILITY = 225;             // Refers to a facility that is client or Landmark owned (pre-carrier)
  const ITEM_SCANNED_FOR_CROSSING = 250;
  const ITEM_TOUCHED_BY_CARRIER = 275;
  const ITEM_OUT_FOR_DELIVERY = 300;
  const ATTEMPTED_DELIVERY = 400;
  const ITEM_REDIRECTED_TO_NEW_ADDRESS = 450;
  const ITEM_SUCCESSFULLY_DELIVERED = 500;
  const RETURN_RECEIVED = 550;
  const RETURN_FINALIZED = 570;
  const CLAIM_ISSUED = 800;
  const DELIVERY_REFUSED = 900;
  
=end

        # Initialize a new Activity.
        #
        # root - The root Package XML node.
        #
        # Returns the newly initialized Activity.
        def initialize(root)
          @root = root
        end

        def root
          @root
        end

        # The location of this activity event.
        #
        # Returns the Omniship::Landmark::Track::ActivityLocation.
        def location
          node = @root.xpath('Location')
          ActivityLocation.new(node)
        end

        def status
          node = @root.xpath('Status/text()').to_s

          node
        end

        def code
          node = @root.xpath('EventCode/text()').to_s

          node

        end
      end
    end
  end
end
