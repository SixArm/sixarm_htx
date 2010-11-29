#!/usr/bin/env ruby

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

TAG2_KEYS.each{|key| require MYDIR+"tag2/#{key}"}

