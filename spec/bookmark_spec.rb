require "bookmark"

describe Bookmark do

  it "returns URLs" do
    insert_three_bookmarks
    expect(Bookmark.all).to include "http://www.makersacademy.com"
    expect(Bookmark.all).to include "http://www.google.com"
    expect(Bookmark.all).to include "http://www.destroyallsoftware.com"
  end

  it "adds a bookmark to database" do
    Bookmark.create("http://www.facebook.com")
    expect(Bookmark.all).to include "http://www.facebook.com"
  end
end




  # truncate_test_table
    # add_test_url
