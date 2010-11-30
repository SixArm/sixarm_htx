#!/usr/bin/env ruby

EVENHOWARD_GALLERY_COLUMN_COUNT=4

def evenhoward_gallery(text)
  items=evenhoward_gallery_text_to_items(text)
  return evenhoward_gallery_table_of_items(items)
end

def evenhoward_gallery_text_to_items(text)
  text.sub!(/\A[\s\n]+/,'')
  text.sub!(/[\s\n]+\Z/,'')
  items=text.split(/\s*\n###+\s*\n\s*/m).map{|subtext| Item.new_via_text(subtext) }
end

def evenhoward_gallery_table_of_items(items,column_count=EVENHOWARD_GALLERY_COLUMN_COUNT)
  out = []
  out << "<table class=\"gallery\">"
  while items.size >= column_count
    sliced = items.slice!(0,column_count)
    out << "<tr>\n"
    out << sliced.map{|item| "<td>" + item.gallery_item_link + "</td>\n" }
    out << "</tr>\n"
  end
  out << "</table>"
  return out.join("\n")
end

def evenhoward_gallery_tsv(text)
  items=evenhoward_gallery_text_to_items(text)
  puts items.map{|item| item.fields.flatten.join("\t")}.join("\n")
end


  
