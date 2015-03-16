# -*- coding: utf-8 -*-
=begin rdoc


=end

module HTX

  #   Translate `<article_easy>` to correct HTML microformat.
  #
  # Example intput:
  #
  #     <article_easy>
  #     {{cite}}
  #     {{title}}
  #     {{byline}}
  #     {{pubdate}}
  #
  #     {{content}}
  #     </artcle_easy>
  #
  # Example output:
  #
  #     <article cite="{{cite}}" pubdate="{{pubdate}}>
  #       <header>
  #         <hgroup>
  #           <h3>{{title}}</h3>
  #           <h4>{{byline}}<h4>
  #           <h5><time datetime="{{pubdate}}" pubdate>{{pubdate}}</time></h5>
  #         </hgroup>
  #       </header>
  #       <section>
  #         {{content}}
  #       </section>
  #     </article>
  #
  # The cite is required.
  #
  # The title is optional. It defaults to the cite.
  #
  # The byline and pubdate are optional. If they are missing, their items won't be in the output.
  #
  # The header and content are separated by a blank line.
  #
  def htx_t2_article_easy(s)
    header = nil
    if (s=~/\s*\n\s+\n\s*/)
      header=$`
      s=$'
      cite, title, byline, pubdate = header.split(/\s*\n\s*/)
      title ||= cite  # when cite exists, and none of the others exist
      header="" \
             + "<header>" \
             + "<hgroup>\n" \
             + "<h3>#{title}</h3>\n" \
             + (byline ? "<h4>#{byline}<h4>\n" : '') \
             + (pubdate ? "<h5><time datetime=\"#{pubdate}\" pubdate>#{pubdate}</time></h5>\n" : '') \
             + "</hgroup>\n" \
             + "</header>\n"
    end
    return "<article" \
           + (cite ? " cite=\"#{cite}\"" : '') \
           + (pubdate ? " pubdate=\"#{pubdate}\"" : '') \
           +  ">\n" \
           + (header ? header : '') \
           + "<section>#{s}</section>" \
           + "</article>"
  end

end
