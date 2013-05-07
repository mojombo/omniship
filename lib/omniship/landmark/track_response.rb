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

      def root
        @root
      end

      def shipment
        Track::Shipment.new(@root)
      end

      def to_hash
        {
          'Shipment' => shipment.to_hash
        }
      end

      def to_json
        to_hash.to_json
      end
    end
  end
end