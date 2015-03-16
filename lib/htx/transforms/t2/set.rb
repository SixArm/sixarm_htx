# -*- coding: utf-8 -*-
module HTX

  # Transform that sets global variables, one per line.
  #
  # Example input:
  #
  #     <set>
  #     foo: Hello
  #     goo: World
  #     </set>
  #
  # Example output:
  #
  #    (blank)
  #
  # Example runtime:
  #
  #     $var["foo"] = "Hello"
  #     $var["goo"] = "World"
  #
  def htx_t2_set(text)
    text.striplines.each{|line|
      if line=~/^(\w+): /
        @var[$1]||=$'
      end
    }
    return ''
  end

end
