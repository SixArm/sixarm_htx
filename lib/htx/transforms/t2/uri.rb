# -*- coding: utf-8 -*-
module HTX

  # Tranform `<uri>` to an anchor link.
  #
  # Example input:
  #
  #     <uri>http://example.com</uri>
  #
  # Example output:
  #
  #     <a href="http://example.com">http://example.com</uri>
  #
  def htx_t2_uri(s)
    return to_href_link(s)
  end

end
