# -*- coding: utf-8 -*-
=begin rdoc
=end

def tag2_article_easy(s)
  if (s=~/\s*\n\s+\n\s*/)
    header=$`
    s=$'
    cite,headline,byline,pubdate=header.split(/\s*\n\s*/)
    headline||=cite
    header="" \
    + "<header>" \
    + "<hgroup>\n"
    + "<h3>#{headline}</h3>\n" \
    + (byline ? "<h4>#{byline}<h4>\n" : '') \
    + (pubdate ? "<h5><time datetime=\"#{pubdate}\" pubdate>#{pubdate}</time></h5>\n" : '') \
    + "</hgroup>\n" \
    + "</header>\n"
  end
  return "<article" \
  + (cite ? " cite=\"#{cite}\"" : '') \
  + (pubdate ? " pubdate=\"#{pubdate}\"" : '') \
  +  ">\n" \
  + (header ? header : '')
  + "<section>#{s}</section>"
  + "</article>"
end
