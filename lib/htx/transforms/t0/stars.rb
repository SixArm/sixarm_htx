# -*- coding: utf-8 -*-
=begin rdoc

Tranform for star ratings.

The input text is brace-enclosed, and has one or more stars.

Examples:

  [*    ]
  [**   ]
  [***  ]
  [**** ]
  [*****]

The output text uses png images to show the same count of stars.

Examples:

  <img src=star.png><img src=star.png><img src=star.png>

=end

module HTX
  module TR0
    module Stars
      def tr(s)
        s.gsub!(/\[(\*+ *)\]/){
          expand_stars($1)
        }
      end
    end
  end
end
