#!/usr/bin/env ruby

TAG1_KEYS = [
             'include',
             'railapp'
            ]

TAG1_KEYS.each{|key| require MYDIR+"tag1/#{key}"}
