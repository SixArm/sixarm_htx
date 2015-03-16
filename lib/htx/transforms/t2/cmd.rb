# -*- coding: utf-8 -*-
module HTX

  # Transform `<cmd>` to good HTML formatting for typing a keyboard command.
  #
  # Example input:
  #
  #     <cmd>foo</cmd>
  #
  # Example output:
  #
  #     <tt><b><kbd>foo</kbd></b></tt>
  #
  def htx_t2_cmd(e)
    Element.new_with_options(:name => 'tt', :children => Element.new_with_options(:name => 'b', :children => Element.new_with_options(:name => 'kbd', :text => e.text)))
  end

end
