#!/usr/bin/env ruby                                                                                                                                                                                                                          
class EtsyItemImage

  attr_accessor :xid

  def initialize(ops={})
    @xid = ops[:xid]
  end

  def fields
    [
     xid
    ]
  end


  ## Presenters

  def small_url
    "http://ny-image0.etsy.com/il_170x135.#{xid}.jpg"
  end

  def small_width
    170
  end

  def small_height
    135
  end

  def medium_url
    "http://ny-image0.etsy.com/il_560xN.#{xid}.jpg"
  end

  def medium_width
    560
  end

  def medium_height
    raise "unknown"
  end
  
  def large_url
    "http://ny-image0.etsy.com/il_FullxFull.#{xid}.jpg"
  end

  def large_width
    raise "unknown"
  end

  def large_height
    raise "unknown"
  end

end
