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


  def gallery_item
    HTML.div(:class => "gallery_item", :content => (gallery_item_div_image + gallery_item_div_name + gallery_item_div_price))
  end

  def gallery_item_div_image
    HTML.div(:class => "image", :content => gallery_item_link(:content => gallery_item_img))
  end

  def gallery_item_div_name
    HTML.div(:class => "name", :content => gallery_item_link(:content => HTML.span(:class => "name", :content => name)))
  end

  def gallery_item_div_price
    HTML.div(:class => "price", :content => gallery_item_link(:content => HTML.span(:class => "price", :content => "$#{price}")))
  end

  def gallery_item_img
    image = etsy_item.images.first
    "<img width=\"#{image.small_width}\" height=\"#{image.small_height}\" src=\"#{image.small_url}\"/>"
  end

  def gallery_item_link(ops)
    HTML.a(:href => url, :title => link_title, :content => ops[:content])
  end

end
