module MainHelper
  def verify_input(artist)
    return artist.gsub(/[^0-9a-z \.]/i, '')
  end
end
