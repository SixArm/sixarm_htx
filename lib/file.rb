#!/usr/bin/env ruby
require 'fileutils'

class File

 def fullpath
  return (path=~/^\//) ? path : FileUtils.pwd + '/' + path
 end

end


