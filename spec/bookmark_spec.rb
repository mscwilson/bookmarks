require "bookmark"

describe Bookmark do

  it "returns URLs" do
    truncate_test_table
    add_test_url
    expect(Bookmark.all).to include "http://www.makersacademy.com"
  end

end
