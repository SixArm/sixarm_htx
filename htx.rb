#!/usr/bin/env ruby

# HTX is an HTML processor for formatting our site's web pages.
# HTX is an ad-hoc tool somewhat like Markdown, Textile, or XSLT.
#
# HTX is a work in progress and is not intended yet for public use;
# it is based on our older HTX perl code from 1994-1998.
#
# http://sixarm.com


require 'open4'
require 'pp'
require 'cgi'
require 'fileutils'

dir = File.expand_path(File.dirname(__FILE__))+'/'

require dir+'lib/string'
require dir+'lib/file'
require dir+'helpers'

COOK_KEYS = [
             'about',
             'blog'
             ]

TAG1_KEYS = [
             'include',
             'railapp'
            ]

TAG2_KEYS = [
             'article',
             'citelink',
             'cmd',
             'codeblock',
             'lis',
             'list',
             'listy',
             'man',
             'pp',
             'search',
             'see',
             'set',
             'skill',
             'talk',
             'toclist',
             'uri',
             'wikipedia',
             'x'
            ]

COOK_KEYS.each{|key| require dir+"cook/#{key}"}
TAG1_KEYS.each{|key| require dir+"tag1/#{key}"}
TAG2_KEYS.each{|key| require dir+"tag2/#{key}"}


## INITIALIZATION

def init
  pwd = Dir.pwd
  case pwd
 when /webget/
   config('/var/www/webget/html', 'http://webget.com', 'webget@webget.com')
 when /sixarm/
   config('/var/www/sixarm/html', 'http://sixarm.com', 'sixarm@sixarm.com')
 when /joelparkerhenderson/
   config('/var/www/joelparkerhenderson/html', 'http://joelparkerhenderson.com', 'joel@joelparkerhenderson.com')
 when /evenhoward/
   config('/var/www/evenhoward/html', 'http://evenhoward.com', 'evenhoward@gmail.com')
 else
   raise "unknown pwd #{pwd}"
 end
end

def config(docroot, webroot, email)
  @docroot=docroot
  @webroot=webroot
  @email=email
end


def htx(filename)

 return if filename=~/^\.\#/ 

 file = File.open(filename)
 body = file.read
 href = File::expand_path(filename).sub(@docroot,@webroot).sub(/\.ht$/,'.html').sub(/\/index.html$/,'/')

 puts 'HTX ' + file.path + ' ' +href

 @var = Hash.new
 @var['canonical'] = href

 s=htx_process_file_and_body(file,body)
 s=htx_process_entire_page(s)
 s=htx_do_substitutions(s)
 htx_write_results(file,s)
end


def htx_process_file_and_body(file,body)

 s=body

 if file.fullpath=~/\/about\//
  s=cook_about(s)
 end

 if file.fullpath=~/\/blog\//
  s=cook_blog(s)
 end

 s.gsub!(/\[(\*+ *)\]/){
  expand_stars($1)
 }

 return s
end


def htx_process_entire_page(s)

  s = @head+s+@foot

  s.gsub!(/\<(include|railapp-gems-and-plugins) *(.*?)\/>/){
    tag=$1
    attr=$2
    case tag
    when 'include' then
      tag_include(attr) 
    when 'railapp-gems-and-plugins' then
      tag_railapp_gems_and_plugins
    end
  }
 
  while result = s.gsub!(/\<(article|citelink|cmd|ed|javascript|lis|list|listy|man|mysql|ruby|sh|sh0|sh1|sh2|talk|skills|see|set|toclist|uri|wikipedia|wikipedias|x)>(.*?)<\/\1>/m){
      tag=$1
      text=$2
      method="tag2_"+tag.gsub(/\W/,'_')
      send(method,text)
    }
  end

  while result = s.gsub!(/<(sixarm:(x:\w+))>(.*?)<\/\1>/m){
      tag=$1
      text=$3
      method="tag2_"+tag.gsub(/\W/,'_')
      send(method,text)
    }
  end

puts s
  return s
end


def htx_do_substitutions(s)
 s.gsub!(/<=(\w+)>/){
  @var[$1]
 }
 ['head','body','title'].each{|tag| s.combine_tag(tag)}
 return s
end


def htx_write_results(file,s)
 out = File.open(file.path + 'ml','w')
 out.write(s)
 out.close
end


## MAIN

def main

  init

  if ARGV and ARGV[0] 

    @pwd = Dir.new(Dir.pwd)
    @head = File.open(@docroot + '/head.hti').read
    @disqus = File.open(@docroot + '/disqus.hti').read
    @foot = File.open(@docroot + '/foot.hti').read

    if ARGV[0]='*'
      filenames = @pwd.entries
    else
      filenames = ARGV
    end

    filenames.select{|x| x=~/\.ht$/ }.each{|x| htx(x) }

  end

end

main


