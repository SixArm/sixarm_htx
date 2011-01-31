#!/usr/bin/env ruby

# Return "<tt><b><kbd>#{s}</kbd></b></tt>"

def tag_cmd(e)
  return Element.newer(:name => 'tt', :children => Element.newer(:name => 'b', :children => Element.newer(:name => 'kbd', :text => e.text)))
end
