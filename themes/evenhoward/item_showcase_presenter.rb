#!/usr/bin/env ruby

###
#
#  Item Showcase Presenter
#
#  The "Showcase" displays one item; each item has 3 medium images,
#  short title, price, a link to Etsy, a PayPal "Buy" button,
#  and a longer text description.
#
###

class Item


  def showcase_item_title(title)
    "<h1>#{title}</h1>"
  end


  def showcase_item_subtitle(subtitle)
    "<h2>#{subtitle}</h2>"
  end


  def showcase_item_img(id)
  "<img width=\"240\" height=\"180\" src=\"/images/items/#{id}_240x180.jpg\"/>"
  end


  def showcase_item_pic(id)
    "<a href=\"#\" onclick=\"zoom_item('#{id}'); return false;\">#{item_img(id)}<br/>zoom</a>"
  end


  def showcase_item_pics(ids)
    "<div id=\"thumbnails\"><table class=\"items\"><tr>\n" \
    + ids.map{|id| "<td>#{item_pic(id)}</td>\n" }.join() \
    + "</tr></table></div>\n\n"
    # + "<div id="lightbox" class="hidden" onclick="$(this).toggle('scale');"><img id="lightboximg" width="960" src=""/></zdiv>
  end


end
