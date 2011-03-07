# -*- coding: utf-8 -*-
#!/usr/bin/env ruby
require 'fileutils'

class File

 def fullpath
  return (path=~/^\//) ? path : FileUtils.pwd + '/' + path
 end

end


