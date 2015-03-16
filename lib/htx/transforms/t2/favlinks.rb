# -*- coding: utf-8 -*-
__END__
require 'pathname'
require 'rexml/element'
include REXML

REPO = Pathname.new("/home/sixarm/github/sixarm_icons_favicons/icons/")

def find(find_glob, skip_grep)
  puts "find_glob #{find_glob}"
  paths = find_paths(find_glob)
  if skip_grep then paths.reject!{|x| x.to_s.match(skip_grep)} end
  paths.map{|path| path.sub(/#{REPO.to_s}/,'')}
end

def tag_sixarm_favicons(e)
  find_glob = REPO + "*.png"
  skip_grep = e.attributes["skip"]
  return find(find_glob, skip_grep).map{|path|
    name = path.to_s.sub(/\.png$/,'')
    img = htx_t2_favicon(name)
    a = Element.new_with_options(:name => "a", :attributes => {
      'href' => "http://#{name}"
    })
    a.add_element(img)
    a
  }
end
