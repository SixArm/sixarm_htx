#!/usr/bin/env ruby

def tag2_set(text)
 text.striplines.each{|line|
  if line=~/^(\w+): /
   @var[$1]||=$'
  end
 }
 return ''
end
