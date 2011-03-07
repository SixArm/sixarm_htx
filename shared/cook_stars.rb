# -*- coding: utf-8 -*-
=begin rdoc
=end

def cook_stars(s)
  s.gsub!(/\[(\*+ *)\]/){
    expand_stars($1)
  }
end
