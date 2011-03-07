# -*- coding: utf-8 -*-
=begin rdoc
=end

def tag2_lis(s)
  return s.strip.split(/\n/).map{|line| "<li>#{line_link(line)}</li>\n"}.join('')
end
