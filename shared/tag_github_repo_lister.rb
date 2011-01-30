#!/usr/bin/env ruby
require 'pathname'
require 'rexml/element'
include REXML


# Given a file system glob of repository readme files,
# return an array of [repository, summary] pairs.
#
# The repository is the directory name.
#
# The summary is the first line of the readme file,
# stripped of any leading textile & markdown markup.
#
# @example
#   find_repo_summaries("~/github/*/README*)
#   => [["foo-repo", "This does foo"], ["bar-repo", "This does bar"]]

def find_repo_summary_list(find_repo_readme_glob)
  return find_paths(find_repo_readme_glob).map{|path|
    repo = path.parent.basename.to_s
    summary = `head -1 #{path}`.chomp
    summary = summary.sub(/^ *[=!]*? /,'') # strip leading markdown, textile, etc.
    [repo,summary]
  }
end


def tag_github_repo_lister(e)
  find_glob = e.attributes["find"]
  href_base = "http://github.com/#{e.attributes["user"]}/"
  return repo_lister(find_glob, href_base)
end


def tag_sixarm_repo_lister(e)
  find_glob = "/home/sixarm/github/#{e.attributes["find"]}/README*"
  href_base = "http://github.com/sixarm/"
  return repo_lister(find_glob, href_base)
end


def repo_lister(find_glob, href_base)
  return find_repo_summary_list(find_glob).map{|repo,summary|
    repo_lister_tr(href_base, repo, summary)
  }
end


def repo_lister_tr(href_base,repo,summary)  
  link = Element.newer(:name => "a", :attributes => {'href' => href_base + repo}, :text => repo)
  return Element.newer_tr(:cells => [link, Text.new(summary)])
end



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



module REXML

  class Element

    def self.newer(options)
      e = Element.new(options[:name])
      if options[:attributes] then e.add_attributes(options[:attributes]) end
      if options[:text] then e.add_text(options[:text]) end
      if options[:children] then options[:children].each {|child| e << child } end
      return e
    end

    def self.newer_tr(options)
      options[:children] ||= options[:cells].map{|cell| Element.newer_td(:text => cell)}
      return newer(:name => 'tr', :children => options[:children])
    end

    def self.newer_td(options)
      return newer({:name => 'td'}.merge(options))
    end

  end

end
