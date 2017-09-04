# -*- coding: utf-8 -*-
__END__
=begin rdoc
=end

def tag2_skill(title)
 # e.g. title='Ruby On Rails', alt='Ruby', img='ruby-on-rails', href='ruby-on-rails'
 alt=title.gsub(/\W.*/,'')
 img=title.downcase.gsub(/\W+/,'-')
 href=img
 return "<a href=\"/#{href}.html\"><img border=\"0\" width=\"64\" height=\"110\" src=\"/img/skills/#{img}.jpg\" alt=\"#{alt}\" title=\"#{title}\"></a>"
end

def tag2_skills(titles)
 titles=titles.striplines
 width=(100/titles.size)
 out=''
 titles.each{|title| out << "<td width=\"#{width}%\"><center>" + tag2_skill(title) + "</center></td>\n" }
 out
end
