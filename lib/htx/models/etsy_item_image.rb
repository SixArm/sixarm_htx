# -*- coding: utf-8 -*-
=begin rdoc
=end                                                                                                                       
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

  def host_name
    'ny-image0.etsy.com'
  end

  def small_img
    "<img width=\"#{small_width}\" height=\"#{small_height}\" src=\"#{small_url}\"/>"
  end

  def small_url
    "http://#{host_name}/il_170x135.#{xid}.jpg"
  end

  def small_width
    170
  end

  def small_height
    135
  end

  def medium_img
    "<img width=\"#{medium_width}\" src=\"#{large_url}\"/>"
  end

  def medium_url
    "http://#{host_name}/il_560xn.#{xid}.jpg"
  end

  def medium_width
    560
  end

  def medium_height
    raise "unknown"
  end

  def large_img
    "<img src=\"#{large_url}\"/>"
  end
  
  def large_url
    "http://#{host_name}/il_fullxfull.#{xid}.jpg"
  end

  def large_width
    raise "unknown"
  end

  def large_height
    raise "unknown"
  end

end
