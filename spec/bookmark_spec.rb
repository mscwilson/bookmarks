require "bookmark"

describe Bookmark do

  it "returns URLs" do
    insert_three_bookmarks
    expect(Bookmark.all[0]).to include "http://www.makersacademy.com"
    expect(Bookmark.all[1]).to include "http://www.destroyallsoftware.com"
    expect(Bookmark.all[2]).to include "http://www.google.com"

  end

  it "adds a bookmark to database" do
    Bookmark.create("http://www.facebook.com", "Facebook")
    expect(Bookmark.all[0]).to include "http://www.facebook.com"
    expect(Bookmark.all[0]).to include "Facebook"
  end

  it "initailizes a Bookmark object" do
    bookmark = Bookmark.new("1", "Twitter", "www.twitter.com")
    expect(bookmark.title).to eq "Twitter"
  end


end




  # truncate_test_table
    # add_test_url
