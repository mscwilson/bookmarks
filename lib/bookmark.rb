require 'pg'

class Bookmark

  attr_reader :title, :url, :id

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url 
  end

  def self.all
    out_arr = []
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect dbname: "bookmark_manager_test", user: ENV["USER"]
    else
      connection = PG.connect dbname: "bookmark_manager", user: ENV["USER"]
    end

    results = connection.exec "Select * from bookmarks"
    results.each { |row| out_arr << Bookmark.new(row["id"], row["title"], row['url']) }
    out_arr
  end

  def self.create(website, title)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{website}', '#{title}');")
  end

  def self.delete(id)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("DELETE FROM bookmarks WHERE id='#{id}';")
  end

end
