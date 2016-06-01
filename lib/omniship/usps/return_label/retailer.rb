module Omniship
  module USPS
    module ReturnLabel
      class Retailer

        attr_accessor :name, :address, :root

        def initialize(options={})
          @name = options[:name]
          @address = options[:address]
        end

        def from_xml(root)
          @root = root

          @name = @root.xpath("RetailerName/text()").to_s
          @address = @root.xpath("RetailerAddress/text()").to_s

        end

        def to_xml(xml)
          xml.RetailerName @name
          xml.RetailerAddress @address
        end
      end
    end
  end
end