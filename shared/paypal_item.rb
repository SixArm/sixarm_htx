#!/usr/bin/env ruby                                                                                                                                                                                                                          
class PayPalItem

  attr_accessor :hosted_button_id
  attr_accessor :code
  attr_accessor :description

  def initialize(ops={})
    @hosted_button_id = ops[:hosted_button_id]
    @code = ops[:code]
    @description = ops[:description]
  end


  ### Factories

  def self.new_via_line(line)
    a=PayPalItem.new
    if line=~/^(\w+)\s+(\S+)\s+(.*)$/
      a.hosted_button_id=$1
      a.code=$2
      a.description=$3
    end
    return a
  end


  ### Presenters

  def fields
    [
     hosted_button_id,
     code,
     description
    ]
  end

  def hosted_button_form
    if !hosted_button_id then return nil end
    "<form action=\"https://www.paypal.com/cgi-bin/webscr\" method=\"post\"/>\n" \
    + "<input type=\"hidden\" name=\"cmd\" value=\"_s-xclick\"/>\n" \
    + "<input type=\"hidden\" name=\"hosted_button_id\" value=\"#{hosted_button_id}\"/>\n" \
    + "<input type=\"submit\" value=\"Buy Now\"/>\n" \
    + "</form>"
  end

  def hosted_button_form_blank
    "<form>\n" \
    + "<input type=\"submit\" value=\"Unavailable\"\>\n" \
    + "</form>"
  end

end
