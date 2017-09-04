# -*- coding: utf-8 -*-
=begin rdoc

Transform for star rating icons.

The input text is brace-enclosed, and has one or more stars.

Examples:

  [*    ]
  [**   ]
  [***  ]
  [**** ]
  [*****]

The output text uses png images to show the same count of stars.

Example output:

  <img width="60" height="12" src="/icons/stars/4.png" alt="****" />

=end

class StarRating < HTX::Transforms

  def tr(s)
    s.gsub!(/\[(\*+ *)\]/){
      render($1.length)
    }
  end

  # Render a given number of stars.
  #
  # Example:
  #
  #     render(4)
  #
  # Example output:
  #
  #     <img width=60 height=12 src="/img/icons/starry/4.png" alt="****" />
  #
  def render(n, alt=nil)
    "<img width=60 height=12 src=\"/img/icons/starry/#{n}.png\" alt=\"#{'*' * n}\" />"
  end

end
