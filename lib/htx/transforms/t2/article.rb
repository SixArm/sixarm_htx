# -*- coding: utf-8 -*-
=begin rdoc

Translate `<articler>` to correct HTML microformat.

Example intput:

     <articler>
     {{cite}}
     {{title}}
     {{byline}}
     {{pubdate}}

     {{content}}
     </artcler>

Example output:

     <article cite="{{cite}}" pubdate="{{pubdate}}>
       <header>
         <hgroup>
           <h3>{{title}}</h3>
           <h4>{{byline}}<h4>
           <h5><time datetime="{{pubdate}}" pubdate>{{pubdate}}</time></h5>
         </hgroup>
       </header>
       <section>
         {{content}}
       </section>
     </article>

 The cite is required.

 The title is optional. It defaults to the cite.

 The byline and pubdate are optional. If they are missing, their items won't be in the output.

 The header and content are separated by a blank line.


=end

class Articler < HTX::Transforms

  def tr(e)
    e_header = nil
    s = e.text
    if (s=~/\s*\n\s+\n\s*/)
      header=$`
      s=$'
      cite, title, byline, pubdate = header.split(/\s*\n\s*/)
      title ||= cite # when cite exists, and none of the others exist
      e_header = e_header(title, byline, pubdate)
    end

  end

  # Create the element for the header.
  #
  # Options:
  #
  #   :title
  #   :byline
  #   :pubdate
  #   :cite
  #
  def e_article(o)
    attrs = {}

    Element.new_with_options(
      name: "article",
      attributes: e_article_attributes,
      children: [
        e_header(o),
        e_body(o)
      ]
    )
    return "<article" \

           +  ">\n" \
           + (header ? header : '') \

             + "</article>"
                   end

           # Create the attributes for the article.
      def e_article_attributes(o)
        a = {}
        o[:cite] and a << {cite: o[:cite].to_s}
        o[:pubdate] and a << {pubdate: o[:pubdate].to_s}
        a
      end

  # Create the element for the header.
  #
  # Options:
  #
  #   :title
  #   :byline
  #   :pubdate
  #
  def e_header(o)
    Element.new_with_options(
      name: "header",
      children:
        Element.new_with_options(
        name: "hgroup",
        children: [
          e_header_title(o)
        ]
      )
    )
  end

  # Create the element for the header title.
  #
  # Options:
  #
  #   :title
  #
  def e_header_title(o)
    Element.new_with_options(
      :name => "h3",
      :text => o[:title].to_s
    )
  end

  # Create the element for the header byline.
  #
  # Options:
  #
  #   :byline
  #
  def e_header_byline(o)
    Element.new_with_options(
      name: "h4",
      text: o[:byline].to_s
    )
  end

  # Create the element for the header pubdate.
  #
  # Options:
  #
  #   :pubdate
  #
  def e_header_pubdate(o)
    Element.new_with_options(
      name: "h5",
      children:
        Element.new_with_options(
        name: "time",
        attributes:> {
          "datetime" => o[:pubdate].to_s
          #TODO how to put raw info here?
        }
      )
    )
  end

  # Create the element for the body.
  #
  # Options:
  #
  #   :text
  #
  def e_body(o)
    Element.new_with_options(
      name: "section",
      text: o[:text].to_s
    )
  end

end
