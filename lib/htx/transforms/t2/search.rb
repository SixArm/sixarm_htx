# -*- coding: utf-8 -*-
=begin rdoc
=end

module HTX

  # Transform `<search>` to a search link.
  #
  # Example input:
  #
  #     <search>foo</search>
  #
  # Example output:
  #
  #     <a href="https://www.google.com/search?q=foo">foo</a>
  #
  def htx_t2_search(s)
    return "<a href=\"https://www.google.com/search?q=" + CGI.escape(s) +"\">#{s}</a>"
  end

end
