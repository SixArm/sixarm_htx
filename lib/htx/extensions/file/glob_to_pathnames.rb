require 'pathname'

class File

  # Given a file system glob, return a list of pathnames.
  #
  # @example
  #   find_paths("/foo/bar*)
  #   => ["/foo/bar.txt", "/foo/bar.rdoc"]
  #
  # @return
  #   pathnames
  #
  def glot_to_pathnames(glob)
    return `find #{glob}`.chomp.split(/\n/).map{|x| Pathname.new(x.chomp)}
  end

end
