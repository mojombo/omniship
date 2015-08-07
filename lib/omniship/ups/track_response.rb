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

      def has_left?
        shipment.packages.all?(&:has_left?)
      end

      def has_arrived?
        shipment.packages.all?(&:has_arrived?)
      end
    end
  end
end