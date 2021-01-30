require 'pg'
require_relative "database_connection"
require_relative "comment"

class Bookmark

  attr_reader :title, :url, :id

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url 
  end

  def self.all
    out_arr = []
    results = DatabaseConnection.query("Select * from bookmarks")
    results.each { |row| out_arr << Bookmark.new(row["id"], row["title"], row['url']) }
    out_arr
  end

  def self.create(website, title)
    return false unless is_url?(website)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{website}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(result[0]["id"], result[0]["title"], result[0]["url"])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id=#{id};")
  end

  def self.update(id:, url:, title:)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title='#{title}' WHERE id= #{id} RETURNING id, title, url;")
    Bookmark.new(result[0]["id"], result[0]["title"], result[0]["url"])
  end


  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")
    Bookmark.new(result[0]["id"], result[0]["title"], result[0]["url"])
  end

  def comments(comment_class = Comment)
    comment_class.where(bookmark_id: id)
  end


  private
  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end


end
