# -*- coding: utf-8 -*-
__END__
=begin rdoc
=end

module HTX

  def htx_tr2_sixarm_codeblock(s)
    return codeblock_helper(s,"")
  end

  def htx_tr2_sixarm_x_html(s)
    return codeblock_helper(s,"html")
  end

  def htx_tr2_sixarm_x_javascript(s)
    return codeblock_helper(s,"javascript")
  end

  def htx_tr2_sixarm_x_python(s)
    return codeblock_helper(s,"python")
  end

  def htx_tr2_sixarm_x_ruby(s)
    return codeblock_helper(s,"ruby")
  end

  def htx_tr2_sixarm_x_sh(s)
    return codeblock_helper(s,"sh")
  end

  def htx_tr2_sixarm_x_sh0(s)
    return codeblock_helper(s,"sh0")
  end

  def htx_tr2_sixarm_x_sh1(s)
    return codeblock_helper(s,"sh1")
  end

  def htx_tr2_sixarm_x_sh2(s)
    return codeblock_helper(s,"sh2")
  end

  def htx_tr2_sixarm_x_sql(s)
    return codeblock_helper(s,"sql")
  end

  def htx_tr2_sixarm_x_text(s)
    return codeblock_helper(s,"text")
  end

  private

  def codeblock_helper(code, lang, pygments=nil)
    code.sub!(/^\s*\n/,'')
    open,shut=stream_num_to_html_tag_pair(lang=~/\d$/ ? $& : nil)
    return "<div class=\"codeblock\"><pre><code lang=\"#{lang}\">#{open}"+CGI.escapeHTML(code)+"#{shut}</code></pre></div>"
  end

end
