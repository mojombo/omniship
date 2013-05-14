module OmniShip
  module UPS
    module Track
      class Package

        # The Handsoap XML element representing the root response node.
        attr_accessor :root

        # Initialize a new Package.
        #
        # root - The root Package XML node.
        #
        # Returns the newly initialized Package.
        def initialize(root)
          @root = root
        end

        # Returns the String tracking number.
        def tracking_number
          @root.xpath('./ns:TrackingNumber/text()').to_s
        end

        # The activity of the package in reverse chronological order. Each
        # element represents a stop on the package's journey.
        #
        # Returns an array of OmniShip::UPS::Track::Activity objects.
        def activity
          @root.xpath('./ns:Activity').map do |act|
            Activity.new(act)
          end
        end


        def has_left?
          self.activity.each {|activity|
            if activity.status == "ORIGIN SCAN" || activity.status == "THE SHIPMENT HAS BEEN DROPPED OFF AND IS NOW AT THE UPS STORE(R)"
              return true
            end
          }
          return false
        end

        def has_arrived?
          self.activity.each {|activity|
            if activity.status == "DELIVERED"
              return true
            end
          }
          return false
        end

        # Generate a URL to a Google map showing the package's activity.
        #
        # Returns the String URL.
        def activity_map_url
          url = "http://maps.google.com/maps/api/staticmap?"
          parts = []

          stops =
            activity.select do |act|
              act.location.address.city
            end.map do |act|
              CGI::escape(act.location.address.to_s)
            end.uniq.reverse

          path_parts = []
          path_parts << "path=color:0x0000ff"
          path_parts << "weight:5"
          stops.each { |addy| path_parts << addy }
          parts << path_parts.join('|')

          origin = stops.shift
          last = stops.pop

          parts << "markers=color:red|size:mid|#{origin}" if origin
          parts << "markers=color:green|#{last}"

          parts << 'size=512x512'
          parts << 'maptype=roadmap'
          parts << 'sensor=false'
          url += parts.join('&')
          url
        end
      end
    end
  end
end
