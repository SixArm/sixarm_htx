# -*- coding: utf-8 -*-
=begin

Tranform `<uri>` to an anchor link.

Example inputs:

    <uri>http://example.com</uri>

Example output:

   <a href="http://example.com">http://example.com</uri>

=end

class URI < HTX::Transforms

  def tr(s)
    "<a href=\"#{s}\">#{s}</a>"
  end

end
