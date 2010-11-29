#!/usr/bin/env ruby                                                                                                                                                                                                                          
class PayPalItem

  attr_accessor :hosted_button_id
  attr_accessor :description

  def initialize(ops={})
    @hosted_button_id = ops[:hosted_button_id]
    @description = ops[:description]
  end

  def hosted_button
    if !@xid then return "" end
    "<form action=\"https://www.paypal.com/cgi-bin/webscr\" method=\"post\">\n" \
    + "<input type=\"hidden\" name=\"cmd\" value=\"_s-xclick\">\n" \
    + "<input type=\"hidden\" name=\"hosted_button_id\" value=\"#{hosted_button_id}\">\n" \
    + "<input type=\"submit\" value=\"Buy Now\">\n" \
    + "</form>"
  end

end
