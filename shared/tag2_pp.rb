#!/usr/bin/env ruby

def tag2_pp(s)
  return "\n\n<p>\n" + strip.gsub(/\n\s*\n/,"</p>\n<p>")+"</p>\n"
end
