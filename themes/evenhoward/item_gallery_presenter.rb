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
  "<span class=\"gallery_item_price\">#{price}</div>"
  end


  def gallery_item_img
  "<img class=\"gallery_item_img\" width=\"170\" height=\"135\" src=\"http://ny-image0.etsy.com/il_170x135.#{etsy_item_img_1_id}.jpg\"/>"
  end


  def gallery_item_link
    "<a href=\"http://www.etsy.com/listing/#{etsy_item_slug}\" title=\"#{title} - even howard crochet - #{tooltip}\">" \
    + gallery_item_img + "<br/>\n" \
    + gallery_item_title + "<br/>\n" \
    + gallery_item_price + "</a><br/>\n" \
    + PayPalHostedButton.new(paypal_hosted_button).to_html + "\n" 
  end


end
