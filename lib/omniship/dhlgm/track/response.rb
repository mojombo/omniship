module Omniship
  module DHLGM
    module Track
      class Response
        def initialize(root)
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

        def has_left?
          shipment.packages.all?(&:has_left?)
        end

        def has_arrived?
          shipment.packages.all?(&:has_arrived?)
        end
      end
    end
  end
end