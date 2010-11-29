#!/usr/bin/env ruby                                                                                                                                                                                                                         

def cook_stars(s)
  s.gsub!(/\[(\*+ *)\]/){
    expand_stars($1)
  }
end
