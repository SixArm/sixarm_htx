
### HELPERS


# Return the github url for a given user and repo

def github_url(user,repo)
  "http://github.com/#{user}/#{repo}"
end


# Given a file system glob, return a list of pathnames.
#
# @example
#   find_paths("/foo/bar*)
#   => ["/foo/bar.txt", "/foo/bar.rdoc"]
#
# @return
#   pathnames

def find_paths(glob)
  return `find #{glob}`.chomp.split(/\n/).map{|x| Pathname.new(x.chomp)}
end

