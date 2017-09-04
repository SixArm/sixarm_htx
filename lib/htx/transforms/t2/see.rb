# -*- coding: utf-8 -*-
__END__
=begin rdoc
=end

def tag2_see(s)
  link = (s =~/^\w+:\/\//) ? s.to_href_link : s.to_wiki_link
  return "\n\n<p>See #{link}</p>"
end
