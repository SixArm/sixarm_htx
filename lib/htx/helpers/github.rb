class GitHub

  def to_url(ops={})
    "https://github.com/#{ops[:user]}/#{ops[:repo]}"
  end

end
