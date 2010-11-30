#!/usr/bin/env ruby

add_cook('cook_about')

def cook_about?(raw)
  @var['file_path']=~/\/html\/about$/
end

def cook_about(raw)
 (title,keywords,description,related)=raw.split(/\n=\n/)
 subject = CGI::escape(title)
 cooked = "<h1>#{title}</h1>\n\n#{description}\n\n"
 cooked << "<p><br><hr>\n\n"
 cooked << "<h3>What's Next?</h3>\n\n"
 cooked << "<ul>\n"
 
 if title=~/^Index Of Articles\b/
   #nop
 else
   cooked << "<li><a href=\"/about/\">Index Of Articles: Web Design &amp; Development</a>"
 end

 if related
   cooked << related.split(/\n/).map{|x| "<li>#{x.to_wiki_link}\n" }.join
 end

 cooked <<  "</ul>"

 cooked << @disqus

 page_subtitle=title
 page_description=description

 return cooked
end
