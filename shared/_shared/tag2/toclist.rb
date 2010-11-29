#!/usr/bin/env ruby

def tag2_toclist(s)
  return "<div class=\"toclist\">\n<h4>Contents</h4>" +  tag2_list(s) + "</div>"
end

