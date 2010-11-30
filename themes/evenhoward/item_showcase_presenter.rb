#!/usr/bin/env ruby

###
#
#  Item Showcase Presenter
#
#  The "Showcase" displays one item; each item has small images,
#  short title, price, a link to Etsy, a PayPal "Buy" button,
#  and a longer text description.
#
###

class Item


  def showcase_item_title
    "<h1>#{title}</h1>"
  end

  def showcase_item_category
    "<h2>#{category}</h2>"
  end

  def showcase_item_tags
    "<h3>#{tags}</h3>"
  end

  def showcase_item_description
    "<p>\n\n" + description.gsub(/\n/,"<br/>") + "\n\n</p>\n\n"
  end


  #def showcase_item_img(id)
  #"<img width=\"240\" height=\"180\" src=\"/images/items/#{id}_240x180.jpg\"/>"
  #end


  #def showcase_item_pic(id)
  #  "<a href=\"#\" onclick=\"zoom_item('#{id}'); return false;\">#{item_img(id)}<br/>zoom</a>"
  #end


  def showcase_item_pics
    "<div id=\"showcase_item_pics\"><table class=\"items\"><tr>\n" \
    + etsy_item.showcase \
    + "</tr></table></div>\n\n"
    # + "<div id="lightbox" class="hidden" onclick="$(this).toggle('scale');"><img id="lightboximg" width="960" src=""/></zdiv>
  end


  def showcase_item_page_text
    showcase_item_title \
    + showcase_item_category \
    + showcase_item_tags \
    + showcase_item_pics \
    + showcase_item_description
  end


  def showcase_item_page_file_path
    $htx.docroot + "/items/#{id}.ht"
  end


  def showcase_item_page_set_var
    $htx.var = {
      'file_path' => showcase_item_page_file_path,
      'canonical' => $htx.file_path_to_href(showcase_item_page_file_path)
    }
  end


  def showcase_item_page_output
    showcase_item_page_set_var
    text=$htx.transform(showcase_item_page_text)
    $htx.write_output(showcase_item_page_file_path,text)
  end


end


class EtsyItem

  def showcase
    images.map(&:showcase).join()
  end

end


class EtsyItemImage

  def showcase
    "<td><a href=\"#{large_url}\" title=\"zoom image\">" + small_img + "</a></td>\n" 
  end

end
