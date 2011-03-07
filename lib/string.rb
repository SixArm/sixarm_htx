# -*- coding: utf-8 -*-
#!/usr/bin/env ruby

class String

 def to_href_link
   "<a href=\"#{self}\">#{self}</a>"
 end

 def splitlist
  return strip.gsub(/^ +/,'').split(/\n\n/).map{|x|x.split(/\n/)}
 end

 def to_wiki_word(separator='_')
   return downcase.gsub(/&\w+;/,' ').gsub(/[^a-z0-9]+/,separator)
 end

 def to_wiki_link
  return "<a href=\"#{self.to_wiki_word('-')}.html\">#{self}</a>"
 end

 def to_wikipedia
  return "<a href=\"http://en.wikipedia.org/wiki/#{to_wiki_word}\">#{self.sub(/_\(.*/,'')}</a>"
 end

 def striplines
  return strip.split(/\s*\n\s*/)
 end

 def stripwikipedia
   return sub(/_\(.*/,'')
 end
   
 def stripliner
  return striplines.map{|line| yield(line)}.join("\n")
 end

 def to_keywords
  return strip.gsub(/\W+/,' ').downcase.gsub(/\b(a|an|as|by|for|i|of|on|the|to)\b/,' ').gsub(/  +/,' ')
 end

 def split2(open,shut)
  outer=[]
  inner=[]
  s=self
  while s=~/#{open}(.*?)#{shut}/
   outer << $`
   inner << $1
   s=$'
  end
  outer << s
  return [outer,inner]
 end

 def combine_tag(tagword)
  open="<#{tagword}>"
  shut="</#{tagword}>"
  outer,inner=split2(open,shut)
  return outer.shift + open + inner.join + shut + outer.join
 end

end

