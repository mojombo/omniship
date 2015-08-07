module OmniShip
  module USPS
    class TrackResponse

      def initialize(root)
        @root = root
        result = root.xpath("TrackResponse").xpath("TrackInfo")
        if result.empty?
          errors = root.xpath("Error").map{|err|
            "#{err.xpath("Number").text} - #{err.xpath("Description").text}"
          }.join(", ")
          raise StandardError, errors
        end
        if !result.xpath("Error").empty?
          errors = result.xpath("Error").map{|err|
            "#{err.xpath("Number").text} - #{err.xpath("Description").text}"
          }.join(", ")
          raise StandardError, errors
        end
      end

      def shipment
        Track::Shipment.new(@root)
      end

      def has_left?
        shipment.packages.all?(&:has_left?)
      end

      def has_arrived?
        shipment.packages.all?(&:has_arrived?)
      end

    end
  end
end