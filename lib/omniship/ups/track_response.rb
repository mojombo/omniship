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
    end
  end
end