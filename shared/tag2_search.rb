#!/usr/bin/env ruby

def tag2_search(s)  
  return "<a href=\"http://www.google.com/search?q=" + CGI.escape(s) +"\">#{s}</a>"
end
