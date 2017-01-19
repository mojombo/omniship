module Omniship
  module USPS
    module ReturnLabel
      class Customer

        attr_accessor :name, :address1, :address2, :city, :state, :zip5, :zip4, :root

        def initialize(options={})
          @name = options[:name]
          @address1 = options[:address1] 
          @address2 = options[:address2]
          @city = options[:city]
          @state = options[:state]
          @zip5 = options[:zip5]
          @zip4 = options[:zip4]
        end

        def to_xml(xml)
          xml.CustomerName @name
          xml.CustomerAddress1 @address2 # YES THESE ARE SWITCHED IN THE USPS API
          xml.CustomerAddress2 @address1
          xml.CustomerCity @city
          xml.CustomerState @state
          xml.CustomerZip5 @zip5
          xml.CustomerZip4 @zip4
        end
      end
    end
  end
end