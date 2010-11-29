#!/usr/bin/env ruby                                                             

add_cook('cook_item_page')

def cook_item_page?(raw)
  @var['file_path']=~/\/html\/items\//
end

def cook_item_page(raw)
  (title,subtitle,pic_ids,description)=raw.split(/\n\s*\n/)
  pic_ids = pic_ids.split(/\s*\n\s*/)
  description = description.gsub(/\n/,"<br/>")
  return item_title(title) + "\n\n" + item_subtitle(subtitle) + "\n\n" + item_pics(pic_ids) + "\n\n" + description + "\n\n"
end

