# -*- coding: utf-8 -*-
=begin

Transform `<cmd>` to good HTML formatting for typing a keyboard command.

Example input:

    <cmd>foo</cmd>

Example output:

    <span class="cmd"><tt><b><kbd>foo</kbd></b></tt></span>

=end

class Cmd < HTX::Transforms

  def tr(e)
    e_span(e)
  end

  private

  def e_span(e)
    Element.new_with_options(:name => 'span', :class => 'cmd', :children => e_tt(e))
  end

  def e_tt(e)
    Element.new_with_options(:name => 'tt', :children => e_kbd(e))
  end

  def e_kbd(e)
    Element.new_with_options(:name => 'kbd', :text => e.text)
  end

end
