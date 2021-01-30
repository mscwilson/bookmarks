feature "comments" do

  scenario "add then view a comment" do
    bookmark = Bookmark.create("http://makersacademy.com", "makers")
    visit "/bookmarks"
    first(".bookmark").click_button "Add comment"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

    fill_in "comment", with: "a test comment"
    click_button "Submit"
    expect(first(".bookmark")).to have_content "a test comment"
  end





end
