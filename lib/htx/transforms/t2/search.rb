# -*- coding: utf-8 -*-
=begin rdoc

Transform `<search>` to a search link.

Example input:

    <search>foo</search>

Example output:

    <a href="https://www.google.com/search?q=foo">foo</a>

=end

class Search < HTX::Transforms

  def tr(s)
    "<a href=\"https://www.google.com/search?q=" + CGI.escape(s) +"\">#{s}</a>"
  end

end
