module OmniShip
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

				def from_xml(root)
					@root = root

					@number = @root.xpath("PermitNumber/text()").to_s
					@city = @root.xpath("PermitIssuingPOCity/text()").to_s
					@state = @root.xpath("PermitIssuingPOState/text()").to_s
					@zip5 = @root.xpath("PermitIssuingPOZip5/text()").to_s

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