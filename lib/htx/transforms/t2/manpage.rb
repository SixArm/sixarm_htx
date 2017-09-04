# -*- coding: utf-8 -*-
=begin

Transform `<manpage>{{command}}</manpage>` to search advice for a Unix man page.

Example input:

    <manpage>foo</manpage>

Example output:

    \n\n
    <p>To learn more about <cmd>foo</cmd>
    search <search>"foo" unix man page</search></p>

=end

class ManPage < HTX::Transforms

  def tr(s)
    "\n\n<p>\nTo learn more about " + Cmd.tr(s) + " search " + Search.tr("\"#{s}\" manpage") + "\n</p>"
  end

end
