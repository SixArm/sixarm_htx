# -*- coding: utf-8 -*-
module HTX

  # Transform to include a file.
  #
  # Example input:
  #
  #     <include foo.txt />
  #
  # Example output:
  #
  #     This is the Foo file text.
  #
  def htx_t1_include(filename)
    puts "include #{filename}"
    File.open(filename).read
  end

end
