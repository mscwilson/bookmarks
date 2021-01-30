require 'sinatra/base'
require "sinatra/flash"
require_relative "lib/bookmark"
require_relative "lib/user"
require_relative "database_connection_setup"

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    "Bookmark Manager"
  end

  get "/bookmarks" do
    @user = User.find(session[:user_id])
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


  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect "/bookmarks"
  end


  get "/sessions/new" do
    erb :"sessions/new"
  end

  post "/sessions" do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/bookmarks')
    else
      flash[:notice] = "Please check your email or password."
      redirect "/sessions/new"
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
