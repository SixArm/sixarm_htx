# -*- coding: utf-8 -*-
=begin rdoc

Return "<tt><b><kbd>#{s}</kbd></b></tt>"

=end

def tag_cmd(e)
  return Element.newer(:name => 'tt', :children => Element.newer(:name => 'b', :children => Element.newer(:name => 'kbd', :text => e.text)))
end
