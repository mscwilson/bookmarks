require 'pg'

class Bookmark

  attr_reader :title, :url

  def self.all
    out_arr = []
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect dbname: "bookmark_manager_test", user: ENV["USER"]
    else
      connection = PG.connect dbname: "bookmark_manager", user: ENV["USER"]
    end

    results = connection.exec "Select * from bookmarks"
    # results.each { |row| out_arr << row['url'] }
    results.each { |row| out_arr << row['title'] }
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

end
