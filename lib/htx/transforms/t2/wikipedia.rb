# -*- coding: utf-8 -*-
__END__
=begin rdoc

Transform a phrase to a Wikipedia link.

Example input:

   <wikipedia>Hello World</wikipedia>

Example output:

   <wikipedia>Hello World</wikipedia>

=end

class Wikipedia < HTX::Transforms

  def tr(s)
    return s.to_wikipedia
  end

  def tag2_wikipedias(block)
    "<ul>\n" + block.stripliner{|line| "<li>#{tag2_wikipedia(line)}</li>" } + "</ul>"
  end

end
