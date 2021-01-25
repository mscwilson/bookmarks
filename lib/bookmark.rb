class Bookmark

  attr_reader :title, :url

  def self.all
    @@bookmarks
  end

  def initialize(title, url)
    @title = title
    @url = url
  end


  private
  @@bookmarks = [Bookmark.new("Makers Academy", "https://makers.tech")]

  

end