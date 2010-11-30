#!/usr/bin/env ruby                                                                                                                                                                                                                          
class EtsyItem

  attr_accessor :xid
  attr_accessor :slug
  attr_accessor :images

  def initialize(ops={})
    @xid = ops[:xid]
    @slug = ops[:slug]
    @images = ops[:images]
  end


  ## Presenters

  def fields
    [
     xid,
     slug,
     images.map{|image| image.fields}
    ]
  end

  def url
    "http://www.etsy.com/listing/#{xid}/#{slug}"
  end

end
