# -*- coding: utf-8 -*-
=begin rdoc
=end

def tag1_include(filename)
  puts "include #{filename}"
  File.open(filename).read
end
