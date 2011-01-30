#!/usr/bin/env ruby

EVENHOWARD_GALLERY_COLUMN_COUNT=4

def evenhoward_gallery(text)
puts "evenhoward_gallery"
  items=evenhoward_gallery_tsv_to_items(text.sub(/^\s+/m,'').sub(/\s+/m,''))
  items.each{|item| item.showcase_item_page_output }
  return evenhoward_gallery_table_of_items(items)
end

def evenhoward_gallery_tsv_to_items(tsv)
  rows=tsv.split(/\n/)
  rows.slice!(0,1)
  rows.map{|row| Item.new_via_fields(*row.split(/\t/)) }
end

def evenhoward_gallery_table_of_items(items,column_count=EVENHOWARD_GALLERY_COLUMN_COUNT)
  out = []
  out << "<table class=\"gallery\">"
  while items.size >= column_count
    sliced = items.slice!(0,column_count)
    out << "<tr>\n"
    out << sliced.map{|item| "<td>" + item.gallery_item + "</td>\n" }
    out << "</tr>\n"
  end
  out << "</table>"
  return out.join("\n")
end





  
