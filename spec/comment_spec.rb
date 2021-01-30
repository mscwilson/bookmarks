require "bookmark"
require "comment"

describe Comment do
  
  it "creates a new comment" do
    bookmark = Bookmark.create("http://www.twitter.com", "Twitter")
    comment = Comment.create(text: "test comment", bookmark_id: bookmark.id)

    expect(comment).to be_a Comment
    expect(comment.text).to eq "test comment"
    expect(comment.bookmark_id).to eq bookmark.id
  end

  it "get the relevant comments from the db" do
    bookmark = Bookmark.create("http://www.twitter.com", "Twitter")
    Comment.create(text: "test comment", bookmark_id: bookmark.id)
    Comment.create(text: "another test comment", bookmark_id: bookmark.id)

    comments = Comment.where(bookmark_id: bookmark.id)

    expect(comments.length).to eq 2
    expect(comments.first.text).to eq "test comment"
  end



end