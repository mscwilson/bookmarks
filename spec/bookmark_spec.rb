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

  it "edits an existing bookmark" do
    bookmark = Bookmark.create('http://www.makersacademy.com', "Makers Academy")
    updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')

    expect(updated_bookmark).to be_a Bookmark
    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq 'Snakers Academy'
    expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
  end

  it "finds bookmark by ID" do
    bookmark = Bookmark.create('http://www.makersacademy.com', "Makers Academy")
    result = Bookmark.find(bookmark.id)

    expect(result).to be_a Bookmark
    expect(result.id).to eq bookmark.id
    expect(result.title).to eq 'Makers Academy'
    expect(result.url).to eq 'http://www.makersacademy.com'
  end


end

