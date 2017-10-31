module Omniship
  module DHLGM
    module Track
      class Package < Omniship::Base

        # Returns the String tracking number.
        def tracking_number
          @root.xpath("trackingnumber/text()").to_s
        end

        def activity
          @root.xpath('event').map do |act|
            Activity.new(act)
          end
        end

        # this is actually an indicator that the DHLGM shipping facility has received the package
        def has_left?
          activity.any? {|activity| activity.code.to_i >= 100 }
        end

        # 570 : AVAILABLE FOR PICKUP
        # 580 : ACCEPT OR PICKUP
        # 590 : PICKED UP BY AGENT
        # 600 : DELIVERED
        # 699 : DELIVERY STATUS NOT UPDATED
        def has_arrived?
          activity.any? {|activity|
            ['570', '580', '590', '600'].include? activity.code
          }
        end

        # 510 : SHIPMENT ACCEPTED BY USPS
        # 520 : ARRIVAL AT POST OFFICE
        # 538 : DEPART USPS SORT FACILITY
        # has been accepted by the post office or has been accepted any of these should be good
        def has_arrived_at_usps?
          self.activity.any? do |activity|
            activity.code == '510' or activity.code == '520' or activity.code == '538'
          end
        end
      end
    end
  end
end
