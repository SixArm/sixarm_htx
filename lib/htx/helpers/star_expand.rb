# -*- coding: utf-8 -*-
module HTX

  # Expand stars e.g. "****" to an image.
  #
  # Example:
  #
  #     stars_expand("****")
  #
  # Example output:
  #
  #     <img width=60 height=12 src="/img/icons/starry/4.png" alt="****" />
  #
  def stars_expand(stars)
    "<img width=60 height=12 src=\"/img/icons/starry/#{stars.strip.size}.gif\" alt=\"#{stars}\" />"
  end

end
