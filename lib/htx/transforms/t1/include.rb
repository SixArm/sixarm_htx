# -*- coding: utf-8 -*-
=begin

Transform to include a file.

Example input:

    <include file="foo.txt" />

Example output:

    This is the Foo file text.

=end

class Include < HTX::Transforms

  def tr(filename)
    puts "include #{filename}"
    File.open(filename).read
  end

end
