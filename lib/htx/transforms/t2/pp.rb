# -*- coding: utf-8 -*-
__END__
=begin rdoc
=end

def tag2_pp(s)
  return "\n\n<p>\n" + strip.gsub(/\n\s*\n/,"</p>\n<p>")+"</p>\n"
end
