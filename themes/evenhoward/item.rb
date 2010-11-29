#!/usr/bin/env ruby

class Item

  attr_accessor :title
  attr_accessor :tooltip
  attr_accessor :description
  attr_accessor :price
  attr_accessor :etsy_item_slug
  attr_accessor :etsy_item_img_1_id
  attr_accessor :etsy_item_img_2_id
  attr_accessor :etsy_item_img_3_id
  attr_accessor :paypal_item

  def self.new_via_text(text)
    (title,tooltip,price,etsy_item_slug,etsy_item_img_id_list,paypal_item_info,description_lines)=text.split(/\s*\n\s*/)
    item = Item.new
    item.title=title
    item.tooltip=tooltip
    item.price=price
    item.etsy_item_slug=etsy_item_slug
    item.etsy_item_img_1_id,item.etsy_item_img_2_id,item.etsy_item_img_3_id=etsy_item_img_id_list.split(/\s*,\s*/)
    paypal_item_hosted_button_id,paypal_item_code,paypal_item_description=paypal_item_info.split(/ /)
    item.paypal_hosted_button_id=(paypal_hosted_button_id=='?' ? nil : paypal_hosted_button_id)
    item.description=description_lines.join
    return item
  end

end


