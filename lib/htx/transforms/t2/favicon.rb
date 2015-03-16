# -*- coding: utf-8 -*-
require 'pathname'
require 'rexml/element'
include REXML

module HTX

  # Transform `<favicon>` to a favicon image.
  #
  # Example input:
  #
  #     <favicon>Foo Goo Hoo</favicon>
  #
  # Example output:
  #
  #     <img
  #       class="favicon"
  #       width="16" height="16"
  #       src="/img/icons/favicons/foo-goo-hoo.png"
  #       alt="Foo Goo Hoo"
  #     />
  #
  def htx_t2_favicon(s)
    name = s
    src = = "/img/icons/favicons/" + s.downcase.sub(/\W+/,'-') + ".png"
    img = Element.new_with_options(
      :name => "img",
      :attributes => {
        'class' => 'favicon',
        'width' => 16,
        'height' => 16,
        'src' => src
        'alt' => name
      }
    )
  end

end
