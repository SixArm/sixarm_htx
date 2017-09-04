# -*- coding: utf-8 -*-
=begin

Transform `<list>...</list>` to a HTML list of items.

Example input:

    <list>
    ...
    </list>

Example output:

    <ul>
       <lis>...</lis>
    </ul>

class List < HTX::Transforms

  def tr(s)
    "<ul>\n#{ListItems(s)}</ul>\n"
  end

end
