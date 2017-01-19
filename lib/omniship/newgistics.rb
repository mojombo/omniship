require 'omniship/newgistics/track'

module Omniship
  module Newgistics
    LABEL = "Newgistics"

    # this regex works for the barcode only
    TRACKING_REGEX = /7(21|25)(00|01|10|20)\d{5}\d{2}\d{4}\d{2}\d{7,29}\d/i
    TRACKING_URL = "http://tracking.smartlabel.com/Default.aspx?TrackingValue="
    BARCODE = 'Barcode'
    REFERENCE_NUMBER = 'Reference Number'
    DATE_REGEX =  /\/Date\((\d+)(.+)\)\//

    class << self
      attr_accessor :merchant_id
      attr_accessor :api_key
      attr_accessor :test
    end

    def self.tracking_test?(tracking)
      !!(tracking =~ TRACKING_REGEX)
    end

    def self.track(id, qualifier=BARCODE)
      Track::Request.track(id, qualifier)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end

    private 

    def self.parse_timestamp(date, time=nil)
      return if date.nil? or date.empty?
      # parse epoch from "\/Date(1469163600000-0500)\/" and "\/Date(1484870400000-0600)\/"
      d, epoch_date, date_tz_offset = DATE_REGEX.match(date).to_a.map(&:to_i)
      epoch_date = epoch_date.to_i / 1000.0
      date_tz_offset = date_tz_offset / 100

      date = Time.at(epoch_date)

      if !time.nil?
        d, epoch_time, time_tz_offset = DATE_REGEX.match(time).to_a.map(&:to_i)
        epoch_time = epoch_time.to_i / 1000.0
        time_tz_offset = time_tz_offset / 100

        temp = Time.at(epoch_time)
        date += temp.sec
        date += temp.min * 60
        date += temp.hour * 3600

        date += (date_tz_offset - time_tz_offset) * 3600
      end

      date 
    end
  end
end