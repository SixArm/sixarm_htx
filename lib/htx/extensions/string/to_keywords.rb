class String
  def to_keywords
    strip.gsub(/\W+/,' ').downcase.gsub(/\b(a|an|as|by|for|i|of|on|the|this|that|those|to|you)\b/,' ').gsub(/  +/,' ')
  end
end
