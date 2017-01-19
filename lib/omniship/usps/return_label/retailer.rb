module Omniship
  module USPS
    module ReturnLabel
      class Retailer

        attr_accessor :name, :address, :root

        def initialize(options={})
          @name = options[:name]
          @address = options[:address]
        end

        def to_xml(xml)
          xml.RetailerName @name
          xml.RetailerAddress @address
        end
      end
    end
  end
end