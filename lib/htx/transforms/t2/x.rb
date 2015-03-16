# -*- coding: utf-8 -*-
module HTX

  # Tranform `<x>` as a shortcut for a URI.
  #
  # Example input:
  #
  #     <x>http://example.com</x>
  #
  # Example output:
  #
  #     <a href="http://example.com">http://example.com</a>
  #
  def htx_t2_x(s)
    return s.to_href_link
  end

end
