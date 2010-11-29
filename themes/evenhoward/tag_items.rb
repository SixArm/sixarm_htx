#!/usr/bin/env ruby


def evenhoward_gallery(text)
  text.sub!(/\A[\s\n]+/,'')
  text.sub!(/[\s\n]+\Z/,'')
  items=text.split(/\n\s*\n/).map{|subtext| Item.new_via_text(subtext) }
  out = []
  out << "<table class=\"gallery\">"
  while items.size > 0
    sliced = items.slice!(0,4)
    out << "<tr>\n"
    out << sliced.map{|item| "<td>" + item.gallery_item_link + "</td>\n" }
    out << "</tr>\n"
  end
  out << "</table>"
  return out.join("\n")
end
