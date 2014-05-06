module OmniShip
  module DHLGM
    class TrackResponse

      def initialize(root)
        @root = root
        result = root.xpath("track")
        if !result.xpath("error").empty?
          errors = result.xpath("error").map{|err|
            "#{err.xpath("code").text} - #{err.xpath("description").text}"
          }.join(", ")
          raise StandardError, errors
        end
      end

      def shipment
        Track::Shipment.new(@root.xpath("track/shipment"))
      end

    end
  end
end