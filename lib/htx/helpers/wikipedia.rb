class Wikipedia

  def to_url(ops={})
    locale =
    "http://#{ops[:locale]||'en'}.wikipedia.org/wiki/#{ops[:key]}\">#{ops[:name]}</a>"
    #{self.sub(/_\(.*/,'')}"
  end

end
