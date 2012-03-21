#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
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

def find_repo_summary_list(find_glob, skip_grep, trim_text)
  paths = find_paths(find_glob)
  if skip_grep then paths.reject!{|x| x.to_s.match(skip_grep)} end
  paths.map{|path|
    repo = path.parent.basename.to_s
    summary = `head -1 #{path}`.chomp
    summary = summary.sub(/^[ =!#]*/,'').sub(/#{trim_text}/,'') # strip leading markdown, textile, etc.
    [repo,summary]
  }
end


def tag_sixarm_repo_lister_title(e)
  headline = e.text
  e.text = ''
  return Element.new_with_options_tr(:children => [Element.new_with_options_td(:attributes => {'colspan' => 2}, :children => [Element.new_with_options(:name => 'h3', :text => headline)])])
end


def tag_github_repo_lister_items(e)
  find_glob = e.attributes["find"]
  skip_grep = e.attributes["skip"]
  trim_text = e.attributes["trim"]
  href_base = "http://github.com/#{e.attributes["user"]}/"
  return repo_lister(find_glob, skip_grep, trim_text, href_base)
end


def tag_sixarm_repo_lister_items(e)
  find_glob = "/home/sixarm/github/#{e.attributes["find"]}/README*"
  skip_grep = e.attributes["skip"]
  trim_text = e.attributes["trim"] || "SixArm.com » "
  href_base = "http://github.com/sixarm/"
  return repo_lister(find_glob, skip_grep, trim_text, href_base)
end


def repo_lister(find_glob, skip_grep, trim_text, href_base)
  return find_repo_summary_list(find_glob, skip_grep, trim_text).map{|repo,summary|
    repo_lister_tr(href_base, repo, summary)
  }
end


def repo_lister_tr(href_base,repo,summary)  
  link = Element.new_with_options(:name => "a", :attributes => {'href' => href_base + repo}, :text => repo)
  summary.gsub!(/»/,'')
  return Element.new_with_options_tr(:cells => [link, Text.new(summary)])
end





