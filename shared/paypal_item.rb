#!/usr/bin/env ruby                                                                                                                                                                                                                          
class PayPalItem

  attr_accessor :hosted_button_xid
  attr_accessor :code
  attr_accessor :description

  def initialize(ops={})
    @hosted_button_xid = ops[:hosted_button_xid]
    @code = ops[:code]
    @description = ops[:description]
  end

  def fields
    [
     hosted_button_xid,
     code,
     description
    ]
  end

  def hosted_button_form
    if !hosted_button_xid then return nil end
    "<form action=\"https://www.paypal.com/cgi-bin/webscr\" method=\"post\"/>\n" \
    + "<input type=\"hidden\" name=\"cmd\" value=\"_s-xclick\"/>\n" \
    + "<input type=\"hidden\" name=\"hosted_button_id\" value=\"#{hosted_button_xid}\"/>\n" \
    + "<input type=\"submit\" value=\"Buy\"/>\n" \
    + "</form>"
  end

  def hosted_button_form_blank
    "<form>\n" \
    + "<input type=\"submit\" value=\"Unavailable\"\>\n" \
    + "</form>"
  end

end
