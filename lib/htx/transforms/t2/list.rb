# -*- coding: utf-8 -*-
module HTX

  # Transform `<list>...</list>` to a HTML list of items.
  #
  # Example input:
  #
  #     <list>
  #       ...
  #     </list>
  #
  # Example output:
  #
  #     <ul>
  #       <lis>...</lis>
  #    </ul>
  #
  def htx_tr2_list(s)
    return "<ul>\n#{tag2_lis(s)}</ul>\n"
  end

end
