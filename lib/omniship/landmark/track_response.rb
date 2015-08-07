module OmniShip
  module Landmark
    class TrackResponse

      def initialize(root)
        @root = root
        result = root.xpath("TrackResponse").xpath("Result")
        if result.xpath("Success").text != "true"
          errors = root.xpath("TrackResponse").xpath("Errors").children.map{|err|
            "#{err.xpath("ErrorCode").text} - #{err.xpath("ErrorMessage").text}"
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