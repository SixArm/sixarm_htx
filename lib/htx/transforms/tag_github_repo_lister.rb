# -*- coding: utf-8 -*-
__END__
require 'pathname'
require 'rexml/element'
include REXML

module HTX

  # Transform a repository file glob to a list of repo links and summaries.
  # We use this to quickly scan a catalog of our public repositories.

  def t1_sixarm_repo_lister_title(e)
    headline = e.text
    e.text = ''
    return Element.new_with_options_tr(:children => [Element.new_with_options_td(:attributes => {'colspan' => 2}, :children => [Element.new_with_options(:name => 'h3', :text => headline)])])
  end

  def tr_github_repo_lister_items(e)
    find_glob = e.attributes["find"]
    skip_grep = e.attributes["skip"]
    trim_text = e.attributes["trim"]
    href_base = "http://github.com/#{e.attributes["user"]}/"
    return repo_lister(find_glob, skip_grep, trim_text, href_base)
  end

  def tr_sixarm_repo_lister_items(e)
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

  ###

  private

  # Given a file system glob of repository readme files,
  # return an array of [repo_basename, repo_summary] pairs.
  #
  # @example
  #
  #   find_repo_summaries("~/github/*/README*")
  #   => [["foo-repo", "This does foo"], ["bar-repo", "This does bar"]]
  #
  def find_repo_summary_list(find_glob, skip_grep, trim_text)
    paths = find_paths_with_skip_grep(find_glob, skip_grep)
    paths.map{|path|
      repo_basename = path.parent.basename.to_s
        repo_summary = path_to_summary(path)
        [repo_basename, repo_summary]
    }
  end

  # Find paths with a glob and optional skip grep.
  #
  # @example
  #
  #   find_paths_with_skip_grep("/foo/goo/*.txt", /\Atrash/)
  #
  # @param find_glob [String] e.g. "/foo/goo/*.txt"
  # @param skip_grep [Regexp] e.g. /trash/
  # @return [List<Pathname>] e.g. [/foo/goo/hoo.txt, /foo/goo/ioo.txt]
  #
  def find_paths_with_skip_grep(find_glob, skip_grep)
    paths = find_paths(find_glob)
    skip_grep and paths.reject!{|x| x.to_s.match(skip_grep)}
    paths
  end

  # Given a path, return a summary, such as a title or headline.
  #
  # @example
  #
  #   path_to_summary("/foo/goo/hoo.txt")
  #   #=> "Hoo Title"
  #
  # @param path
  # @return a summary
  #
  def path_to_summary(path, trim_text = nil)
    summary = `head -1 #{path}`.chomp
    summary.sub(/^[ =!#]*/,'').sub(/#{trim_text}/,'') # strip leading markdown, textile, etc.
  end

end
