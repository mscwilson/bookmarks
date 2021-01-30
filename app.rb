require 'sinatra/base'
require "sinatra/flash"
require_relative "lib/bookmark"
require_relative "database_connection_setup"

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    "Bookmark Manager"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get "/bookmarks/new" do
    erb :"bookmarks/new"
  end

  post "/bookmarks" do
    flash[:notice] = "Not a valid URL" unless Bookmark.create(params["url"], params["title"])
    redirect "/bookmarks"
  end

  delete "/bookmarks/:id" do
    Bookmark.delete(params[:id])
    redirect "/bookmarks"
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(params[:id])
    erb :"bookmarks/edit"
  end

  patch "/bookmarks/:id" do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect "/bookmarks"
  end



  get "/bookmarks/:id/comments/new" do
    @bm_id = params[:id]
    erb :"bookmarks/comments/new"
  end

  post "/bookmarks/:id/comments" do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
