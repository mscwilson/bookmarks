require 'pg'

class Bookmark

  attr_reader :title, :url

  def self.all(database = 'bookmark_manager')
    self.urls_from_db(database)
  end

  def self.urls_from_db(database)
    out_arr = []
    begin
      connection = PG.connect dbname: database, user: ENV["USER"]
      results = connection.exec "Select * from bookmarks"
      results.each { |row| out_arr << row['url'] }

    rescue PG::Error => e
      puts e.message

    ensure
      results.clear if results
      connection.close if connection
    end
    out_arr
  end

  private_class_method :urls_from_db


end
