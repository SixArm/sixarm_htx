#!/usr/bin/env ruby

class Item

  attr_accessor :title
  attr_accessor :tooltip
  attr_accessor :price
  attr_accessor :etsy_item_slug
  attr_accessor :etsy_item_img_id
  attr_accessor :paypal_hosted_button_id

  def gallery_item_title
    "<span class=\"gallery_item_title\">#{title}</div>"
  end

  def gallery_item_price
  "<span class=\"gallery_item_price\">#{price}</div>"
  end

  def gallery_item_img
  "<img class=\"gallery_item_img\" width=\"170\" height=\"135\" src=\"http://ny-image0.etsy.com/il_170x135.#{etsy_item_img_id}.jpg\"/>"
  end

  def gallery_item_link
    "<a href=\"http://www.etsy.com/listing/#{etsy_item_slug}\" title=\"#{title} - even howard crochet - #{tooltip}\">" \
    + gallery_item_img + "<br/>\n" \
    + gallery_item_title + "<br/>\n" \
    + gallery_item_price + "</a><br/>\n" \
    + paypal_hosted_button + "\n" 
  end

  def paypal_hosted_button
    if !paypal_hosted_button_id then return "" end
    "<form action=\"https://www.paypal.com/cgi-bin/webscr\" method=\"post\">\n" \
    + "<input type=\"hidden\" name=\"cmd\" value=\"_s-xclick\">\n" \
    + "<input type=\"hidden\" name=\"hosted_button_id\" value=\"#{paypal_hosted_button_id}\">\n" \
    + "<input type=\"submit\" value=\"Buy Now\">\n" \
    + "</form>"
  end

end


def evenhoward_gallery(text)
  text.sub!(/\A[\s\n]+/,'')
  text.sub!(/[\s\n]+\Z/,'')
  items=text.split(/\n\s*\n/).map{|x| evenhoward_gallery_item(x) }
  out = []
  out << "<table class=\"gallery\">"
  while items.size > 0
    sliced = items.slice!(0,4)
    out << "<tr>\n"
    out << sliced.map{|item| "<td>" + item.gallery_item_link + "</td>\n" }
    out << "</tr>\n"
  end
  out << "</table>"
  return out.join("\n")
end


def evenhoward_gallery_item(text)
  (title,tooltip,price,etsy_item_slug,etsy_item_img_id,paypal_hosted_button_id)=text.split(/\s*\n\s*/)
  item = Item.new
  item.title=title
  item.tooltip=tooltip
  item.price=price
  item.etsy_item_slug=etsy_item_slug
  item.etsy_item_img_id=etsy_item_img_id
  item.paypal_hosted_button_id=(paypal_hosted_button_id=='?' ? nil : paypal_hosted_button_id)
  return item
end



def item_title(title)
  "<h1>#{title}</h1>"
end

def item_subtitle(subtitle)
  "<h2>#{subtitle}</h2>"
end

def item_img(id)
  "<img width=\"240\" height=\"180\" src=\"/images/items/#{id}_240x180.jpg\"/>"
end

def item_pic(id)
  "<a href=\"#\" onclick=\"zoom_item('#{id}'); return false;\">#{item_img(id)}<br/>zoom</a>"
end

def item_pics(ids)
  "<div id=\"thumbnails\"><table class=\"items\"><tr>\n" \
  + ids.map{|id| "<td>#{item_pic(id)}</td>\n" }.join() \
  + "</tr></table></div>\n\n"
  # + "<div id="lightbox" class="hidden" onclick="$(this).toggle('scale');"><img id="lightboximg" width="960" src=""/></zdiv>
end
