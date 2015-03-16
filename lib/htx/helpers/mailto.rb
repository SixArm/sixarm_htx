module HTX
  def mailto(email,subject,text)
    return "<a href=\"mailto:#{email}?subject=#{subject}\">#{text}</a>"
  end
end
