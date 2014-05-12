module OmniShip
  module DHLGM
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
          @root.xpath("trackingnumber/text()").to_s
        end

        # The activity of the package in reverse chronological order. Each
        # element represents a stop on the package's journey.
        #
        # Returns an array of OmniShip::DHLGM::Track::Activity objects.
        def activity
          @root.xpath('event').map do |act|
            Activity.new(act)
          end
        end

        
        # The scheduled delivery date. If a specific time of day is available
        # then it will be set, otherwise the time will be set to noon. If no
        # delivery date is available, the result will be nil.
        #
        # Returns the Time of the delivery, or nil if none is available.
        def scheduled_delivery
         # not supported by DHLGM
         nil
        end

        #
        # Returns the String delivery date or nil if none is available.
        def scheduled_delivery_date
         # not supported by DHLGM
         nil 
        end

        # this is actually an indicator that the DHLGM shipping facility has received the package
        def has_left?
          self.activity.each {|activity|
            if ['100', '110', '115', '120', '125', '130'].include? activity.code
              return true
            end
          }
          return false
        end

        def has_arrived?
          self.activity.each {|activity|
            if ['570', '580', '590', '600'].include? activity.code
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
