# -*- coding: utf-8 -*-
=begin

Transform `<favicon>` to a favicon image.

Example input:

    <favicon>Foo Goo Hoo</favicon>

Example output:

    <img
      class="favicon"
      width="16"
      height="16"
      src="/img/icons/favicons/foo-goo-hoo.png"
      alt="Foo Goo Hoo"
    />

=end

require 'pathname'
require 'rexml/element'
include REXML

class FavIcon < HTX::Transforms

  def tr(e)
    name = e.text
    Element.new_with_options(
      name: "img",
      attributes: {
        class: a_class,
        width: a_width,
        height: a_height,
        src: a_src(name),
        alt: a_alt(name)
      }
    )
  end

  def a_class
    "favicon"
  end

  def a_width
    16
  end

  def a_height
    16
  end

  def a_src(name)
    "/img/icons/favicons/" + name.downcase.sub(/\W+/,'-') + ".png"
  end

  def a_alt(name)
    name
  end

end
