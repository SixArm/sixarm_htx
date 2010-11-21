#!/usr/bin/env ruby

def tag2_man(s)
  return "\n\n<p>\nTo learn more about " + tag2_cmd(s) + ", search the net for: " + tag2_search("unix man page #{s}") + "\n</p>"
end
