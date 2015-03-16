# -*- coding: utf-8 -*-
__END__
=begin rdoc
=end

def line_link(line)
  line.sub(/^(\w+:\/\/.*?)\s+/){ return "<a href=\"#{$1}\">#{$'}</a>\n" }
  line.sub(/^(\w+:\/\/.*?)$/){ return "<a href=\"#{$1}\">#{$1}</a>\n" }
end


# HTML has a variety of semantic tags to indicate computer input and output.
#
# In Unix, the typicaly input and output streams are numbered:
# - 0 is stdin aka input
# - 1 is stdout aka output
# - 2 is stderr aka error
#
# We use these numbers to return a HTML tag pair suitable for wrapping:
# - 0 => ["<kbd class=\"input\">","</kbd>"]
# - 1 => ["<samp class=\"output\">","</samp>"]
# - 2 => ["<samp class=\"error\">","</samp>"]
# - anything else => ["",""]
#
# @param [Integer,to_i,nil] stream_num 0 is input, 1 is output, 2 is error
# @return [Array] HTML tag pair

def stream_num_to_html_tag_pair(stream_num=nil)
  return stream_num==nil \
  ? ["",""] \
  : case stream_num.to_i
    when 0
      ["<kbd class=\"input\">","</kbd>"]
    when 1
      ["<samp class=\"output\">","</samp>"]
    when 2
      ["<samp class=\"error\">","</samp>"]
    else
      ["",""]
    end

#def pygmentize(s, lexer_name)
# f = IO.popen("pygmentize -f html -l " + lexer, 'w+')
# f.write(s)
# f.close_write
# return f.read
#end

  def page_subtitle=(subtitle)
    @var['subtitle']=subtitle
  end

  def page_description=(s)
    @var['description']=s.gsub(/<.*?>/,'')[0..128]+'...'
    @var['keywords'] || (page_keywords=s)
  end

  def page_keywords=(s)
    @var['keywords']=s.to_keywords[0..128]
  end

end
