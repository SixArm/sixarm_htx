#!/usr/bin/env ruby

COOK_KEYS = [
             'about',
             'blog'
             ]

COOK_KEYS.each{|key| require MYDIR+"cook/#{key}"}
