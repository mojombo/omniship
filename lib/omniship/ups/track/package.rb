module OmniShip
  module UPS
    module Track
      class Package

        attr_accessor :root

        # Initialize a new Package.
        #
        # root - The root Package XML node.
        #
        # Returns the newly initialized Package.
        def initialize(root, parent)
          @root = root
          @parent = parent
        end

        # Returns the String tracking number.
        def tracking_number
          @root.xpath('TrackingNumber/text()').to_s
        end

        # The activity of the package in reverse chronological order. Each
        # element represents a stop on the package's journey.
        #
        # Returns an array of OmniShip::UPS::Track::Activity objects.
        def activity
          @root.xpath('Activity').map do |act|
            Activity.new(act)
          end
        end

        # The scheduled delivery date. If a specific time of day is available
        # then it will be set, otherwise the time will be set to noon. If no
        # delivery date is available, the result will be nil.
        #
        # Returns the Time of the delivery, or nil if none is available.
        def scheduled_delivery
          @parent.scheduled_delivery
        end

        # The scheduled delivery date as a String in YYYYMMDD format.
        #
        # Returns the String delivery date or nil if none is available.
        def scheduled_delivery_date
          @parent.scheduled_delivery_date
        end

        def alternate_tracking
          @root.xpath('AlternateTrackingInfo').map do |alt|
            AlternateTracking.new(alt)
          end
        end


        def has_left?
          self.activity.each {|activity|
            if activity.code == "I"
              return true
            end
          }
          false
        end

        def has_arrived?
          self.activity.each {|activity|
            if activity.code == "D"
              return true
            end
          }
          false
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
