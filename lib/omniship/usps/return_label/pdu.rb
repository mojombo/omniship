module Omniship
  module USPS
    module ReturnLabel
      class PDU
        attr_accessor :po_box,:city, :state, :zip5, :zip4, :root

        def initialize(options={})
          @po_box = options[:po_box]
          @city = options[:city]
          @state = options[:state]
          @zip5 = options[:zip5]
          @zip4 = options[:zip4]
        end

        def to_xml(xml)
          xml.PDUPOBox @po_box
          xml.PDUCity @city
          xml.PDUState @state
          xml.PDUZip5 @zip5
          xml.PDUZip4 @zip4
        end
      end
    end
  end
end