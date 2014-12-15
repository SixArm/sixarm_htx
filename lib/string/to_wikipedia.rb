class String
  def link_wikipedia
    "http://en.wikipedia.org/wiki/#{to_wiki_word}\">#{self.sub(/_\(.*/,'')}"
  end
end