require 'sinatra'
require_relative "lib/bookmark"

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    @just_the_titles = []
    @bookmarks.each do |bookmark|
      @just_the_titles << bookmark[1]

    end
    erb :bookmarks
  end

  post "/add_bookmark" do
    Bookmark.create(params["url"], params["title"])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
