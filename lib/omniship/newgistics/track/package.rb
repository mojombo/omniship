module Omniship
  module Newgistics
    module Track
      class Package

        # Initialize a new Package.
        #
        #
        # Returns the newly initialized Package.
        def initialize(root)
          @root = root
        end

        def root
          @root
        end

        # Returns the String tracking number.
        def tracking_number
          @root["TrackingNumber"]
        end

        # The activity of the package in reverse chronological order. Each
        # element represents a stop on the package's journey.
        #
        # Returns an array of Omniship::Newgistics::Track::Activity objects.
        def activity
          if @root["PackageTrackingEvents"]
            @root["PackageTrackingEvents"].map do |act|
              Activity.new(act)
            end
          else
            []
          end
        end

        def has_left?
          ["Received", "InTransit", "Delivered", "Departed", "InUSPSNetwork"].include?(@root["Status"])
        end

        def has_arrived?
          @root["Status"] == "Delivered"
        end

        def scheduled_delivery_date
         @root["EstimatedDeliveryDate"]
        end

        def scheduled_delivery
          if date = scheduled_delivery_date and !date.empty?
            # parse epoch from "\/Date(1343702575000-0500)\/"
            epoch = /\d+/.match(scheduled_delivery_date)[0].to_i / 1000
            start_date = DateTime.at(epoch)
          end
        end


        # Generate a URL to a Google map showing the package's activity.
        #
        # Returns the String URL.
        def activity_map_url
          url = "http://maps.google.com/maps/api/staticmap?"
          parts = []

          stops =
            activity.map do |act|
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
