
class HTML

  # Return an HTML anchor, e.g. '<a href="foo" title="goo">hoo</a>"
  #
  # Options:
  #   :class => div class
  #   :content => what the div surrounds

  def self.a(ops={})
    "<a href=\"#{ops[:href]}\" title=\"#{ops[:title]}\">#{ops[:content]}</a>" 
  end


  # Return an HTML div, e.g. '<div class="foo">goo</div>"
  #
  # Options:
  #   :class => div class
  #   :content => what the div surrounds

  def self.div(ops={})
    return "<div class=\"#{ops[:class]}\">#{ops[:content]}</div>\n"
  end


  # Return an HTML span, e.g. '<span class="foo">goo</span>"
  #
  # Options:
  #   :class => div class
  #   :content => what the div surrounds

  def self.span(ops={})
    return "<span class=\"#{ops[:class]}\">#{ops[:content]}</span>"
  end

end


