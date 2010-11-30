#!/usr/bin/env ruby
require 'pp'

class Item

  attr_accessor :title
  attr_accessor :tags
  attr_accessor :category
  attr_accessor :description
  attr_accessor :price
  attr_accessor :etsy_item
  attr_accessor :paypal_item

  def self.new_via_text(text)
    (title,tags,category,price,etsy_item_xid,etsy_item_slug,etsy_item_image_xid_list,paypal_item_line,*description_lines)=text.split(/\s*\n\s*/)
    item = Item.new
    item.title=title
    item.tags=tags
    item.category=category
    item.price=price
    item.etsy_item=EtsyItem.new(
                                :xid => etsy_item_xid,
                                :slug => etsy_item_slug,
                                :images => etsy_item_image_xid_list.split(/\s*,\s*/).map{|xid| EtsyItemImage.new(:xid => xid) }
                                )
    item.paypal_item=PayPalItem.new_via_line(paypal_item_line)
    item.description=description_lines.join
    return item
  end


  ## Presenters

  def fields
    [
     title,   
     tags,
     category,
     description,
     price,
     etsy_item.fields,
     paypal_item.fields
     ]
  end


end


