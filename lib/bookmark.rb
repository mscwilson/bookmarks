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
  @@bookmarks = [["Makers Academy", "https://makers.tech"], ["Twitter", "https://twitter.com"], ["Facebook", "https://www.facebook.com"]]



end
