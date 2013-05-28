module OmniShip
  module USPS
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
          @root.attribute("ID").to_s
        end

        # The activity of the package in reverse chronological order. Each
        # element represents a stop on the package's journey.
        #
        # Returns an array of OmniShip::USPS::Track::Activity objects.
        def activity
          @root.xpath('TrackSummary').map do |act|
            Activity.new(act)
          end
          @root.xpath('TrackDetail').map do |act|
            Activity.new(act)
          end
        end

        # this is actually an indicator that the the package has been scanned by USPS ANYWHERE
        def has_left?
          self.activity.each {|activity|
            if activity.code == "10"
              return true
            end
          }
          return false
        end

        def has_arrived?
          self.activity.each {|activity|
            if activity.code == "01" or activity.code == "03" or activity.code == "16" or activity.code == "14" # deliverred or ready for pickup at post office
              return true
            end
          }
          return false
        end

        def scheduled_delivery_date
         @root.xpath("ExpectedDeliveryDate/text()").to_s
        end

        def scheduled_delivery
          if date = scheduled_delivery_date and !date.empty?
            fmt = "%b %d, %Y %Z"
            start_date = DateTime.strptime(date + " CST", fmt)
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
