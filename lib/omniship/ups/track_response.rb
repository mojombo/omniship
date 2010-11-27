module OmniShip
  module UPS
    class TrackResponse
      attr_accessor :root

      def initialize(root)
        @root = root
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