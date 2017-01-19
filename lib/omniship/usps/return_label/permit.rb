module Omniship
  module USPS
    module ReturnLabel
      class Permit

        attr_accessor :number, :city, :state, :zip5, :state, :zip5, :root

        def initialize(options={})
          @number = options[:number]
          @city = options[:city]
          @state = options[:state]
          @zip5 = options[:zip5]
        end

        def to_xml(xml)
          xml.PermitNumber @number
          xml.PermitIssuingPOCity @city
          xml.PermitIssuingPOState @state
          xml.PermitIssuingPOZip5 @zip5
        end
      end
    end
  end
end