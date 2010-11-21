#!/usr/bin/env ruby

def tag2_lis(s)
  return s.strip.split(/\n/).map{|line| "<li>#{line_link(line)}</li>\n"}.join('')
end
