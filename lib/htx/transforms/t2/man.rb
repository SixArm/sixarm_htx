# -*- coding: utf-8 -*-
module HTX

  # Tranform `<man>{{command}}</man>` to search advice for a Unix man page.
  #
  # Example input:
  #
  #     <man>foo</man>
  #
  # Example output:
  #
  #     \n\n
  #     <p>To learn more about <cmd>foo</cmd>
  #     search <search>foo unix man page</search></p>
  #
  def htx_t2_man(s)
    return "\n\n<p>\nTo learn more about " + htx_t2_cmd(s) + " search " + htx_t2_search("\"#{s}\" unix man page") + "\n</p>"
  end

end
