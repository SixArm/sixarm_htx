#!/usr/bin/env ruby                                                                                                                                                                                                                         

###
#
#  Item Gallery Presenter
#
#  The "Gallery" displays many items; each item has a small image,
#  short title, price, a link to Etsy, and a PayPal "Buy" button.
#
###

 
class Item


  def gallery_item_title
    "<span class=\"gallery_item_title\">#{title}</div>"
  end


  def gallery_item_price
  "<span class=\"gallery_item_price\">$#{price}</div>"
  end


  def gallery_item_img
    image = etsy_item.images.first
    "<img class=\"gallery_item_img\" width=\"#{image.small_width}\" height=\"#{image.small_height}\" src=\"#{image.small_url}\"/>"
  end


  def gallery_item_link_title
    "#{title} - #{category} - #{tags}"
  end


  def gallery_item_buy
    paypal_item.hosted_button_form || paypal_item.hosted_button_form_blank
  end


  def gallery_item_link
    "<a href=\"#{etsy_item.url}\" title=\"#{gallery_item_link_title}\">" \
    + gallery_item_img + "<br/>\n" \
    + gallery_item_title + "<br/>\n" \
    + gallery_item_price + "</a><br/>\n" \
    + gallery_item_buy + "\n" 
  end

end
