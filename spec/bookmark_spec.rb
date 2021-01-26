require "bookmark"

describe Bookmark do

  it "returns URLs" do
    expect(Bookmark.all).to include "http://www.makersacademy.com"
  end

  # describe '::urls_from_db' do
  #   it 'returns urls' do
  #     expect(Bookmark.urls_from_db).to include "http://www.makersacademy.com"
  #   end
  # end

  # it "has a name" do
  #   expect(bookmark.title).to eq "Makers Academy"
  # end

  # it "has a URL" do
  #   expect(bookmark.url).to eq "https://makers.tech"
  # end

end
