# -*- coding: utf-8 -*-
=begin rdoc
=end

def tag2_wikipedia(phrase)
 return phrase.to_wikipedia
end

def tag2_wikipedias(block)
 return "<ul>\n" + block.stripliner{|line| "<li>#{tag2_wikipedia(line)}</li>" } + "</ul>"
end


