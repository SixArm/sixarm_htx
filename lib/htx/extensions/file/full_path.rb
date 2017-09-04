require 'fileutils'

class File

 def full_path
  return (path=~/^\//) ? path : FileUtils.pwd + '/' + path
 end

end
