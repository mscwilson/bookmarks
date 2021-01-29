require "bookmark"

describe Bookmark do

  it "returns URLs" do
    insert_three_bookmarks
    expect(Bookmark.all[0].url).to eq "http://www.makersacademy.com"
    expect(Bookmark.all[1].url).to eq "http://www.destroyallsoftware.com"
    expect(Bookmark.all[2].url).to eq "http://www.google.com"

  end

  it "adds a bookmark to database" do
    Bookmark.create("http://www.facebook.com", "Facebook")
    expect(Bookmark.all[0].url).to eq "http://www.facebook.com"
    expect(Bookmark.all[0].title).to eq "Facebook"
  end

  it "initializes a Bookmark object" do
    bookmark = Bookmark.new("1", "Twitter", "www.twitter.com")
    expect(bookmark.title).to eq "Twitter"
  end


end




  # truncate_test_table
    # add_test_url
