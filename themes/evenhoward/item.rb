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

  def initialize(ops={})
    @title=ops[:title]
    @tags=ops[:tags]
    @category=ops[:category]
    @description=ops[:description]
    @price=ops[:price]
    @etsy_item=ops[:etsy_item]
    @paypal_item=ops[:paypal_item]
  end

  def self.new_via_fields(
     title,
     tags,
     category,
     description,
     price,
     etsy_item_xid,
     etsy_item_slug,
     etsy_item_image_1_xid,
     etsy_item_image_2_xid,
     etsy_item_image_3_xid,
     paypal_item_hosted_button_xid,
     paypal_item_code,
     paypal_item_description
   )
    item = Item.new(
     :title => title,
     :tags => tags,
     :category => category,
     :price => price,
     :description => description
    )
    item.etsy_item = EtsyItem.new(
       :xid => etsy_item_xid,
       :slug => etsy_item_slug,
       :images => [etsy_item_image_1_xid,etsy_item_image_2_xid,etsy_item_image_3_xid].map{|xid| EtsyItemImage.new(:xid => xid) }
    )
    item.paypal_item = PayPalItem.new(
      :hosted_button_xid => paypal_item_hosted_button_xid,
      :code => paypal_item_code,
      :description => paypal_item_description
    )
    return item
  end


  ## Presenters

  def id
    etsy_item.xid
  end

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


