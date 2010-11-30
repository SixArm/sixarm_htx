#!/usr/bin/env ruby

def tag1_railapp_gems_and_plugins

  out=[]      # pretty output for the web page, which lists all the gems and plugins with notes
  install=[]  # install script to run on the unix command line, which installs gems and plugins
  config=[]   # ruby lines to add to rails config.rb, which requires certain gem versions

  gem_source_keyword_to_uri = {
   'railapp' => 'http://railapp.com',
   'github' => 'http://gems.github.com',
   'rubyforge' => 'http://gems.rubyforge.org',
  }

  install << "<h3>RailApp install script</h3>"
  install << "Run these commands from your rails application directory."
  install << "<pre>"
  install << "gem update --system"
  install << "gem sources --add http://gemcutter.org"
  install << "gem sources --add http://gems.rubyforge.org"
  install << "gem sources --add http://gems.github.com"
  install << "gem sources --add http://railapp.com"
  install << "gem install gemcutter"
  install << "gem tumble"

  config << "<h3>RailApp lines to add to your config.rb</h3>"
  config << "<pre>"

  out << "<h3>RailApp gems</h3>"
  out << "<dl>"

  gem_entries=File.open('/www/virtualhosts/railapp/gems.hti').read
  gem_entries.splitlist.each{|x|
   name, desc, uri, version = x
   if uri=='http://railapp.com' then uri+='/gems/'+name end
   if uri=~/^http:\/\/[^\/]*?(railapp|github|rubyforge)\.(com|org)/
     source = ", :source=>'#{gem_source_keyword_to_uri[$1]}'"
   else
     source = ''
   end
   out << "<dt>#{name}</dt>"
   out << "<dd>#{desc}<br>\n<a href=\"#{uri}\">#{uri}</a><br>\nversion #{version}</dd>"
   #install << "GEM_HOME=vendor/gems gem install --no-ri --no-rdoc --test --development #{name}"
   install << "gem install --test --development #{name}"
   config << "config.gem \"#{name}\", :version=>'#{version}'"+source
  }
  out << "</dl>\n\n"

  out << "<h3>RailApp plugins</h3>"
  out << "<dl>"

  plugin_entries=File.open('/www/virtualhosts/railapp/plugins.hti').read.splitlist
  plugin_entries.each{|x|
   name, desc, uri, repo = x
   out << "<dt><b>#{name}</b></dt>"
   out << "<dd>#{desc}<br>\n<a href=\"#{uri}\">#{uri}</a><br>\n#{repo}</dd>"
    install << "script/plugin install #{repo}"
  }

 config << "</pre>\n"
 install << "</pre>\n"
 return (out+install+config).join("\n") + "\n\n"

end
