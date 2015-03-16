['file/full_path', 'file/glob_to_pathnames', 'github', 'html', 'wikipedia'].map{|x|
  require File.dirname(__FILE__) + "/htx/#{x}.rb"
}
