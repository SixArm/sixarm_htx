# -*- coding: utf-8 -*-
=begin

Transform to set global variables, one per line.

Example input:

    <set>
    foo: Hello
    goo: World
    </set>

Example output:

   (blank)

Example runtime:

    $var["foo"] = "Hello"
    $var["goo"] = "World"

=end

class Set < HTX::Transforms

  def tr(s)
    s.striplines.each{|line|
      if line=~/^(\w+): /
        set($1,$')
      end
    }
    ''
  end

  def set(k, v)
    @var[$1]||=$'
  end

end
