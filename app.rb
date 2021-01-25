require 'sinatra'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Welcome to your Bookmark Manager!'
  end

  run! if app_file == $0
end
