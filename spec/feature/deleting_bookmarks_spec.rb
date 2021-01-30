feature "deleting a bookmark" do
  scenario "deleting bookmarks" do
    visit "/bookmarks"
    fill_in "url", with: "http://www.twitter.com"
    fill_in "title", with: "Twitter"
    click_button "Add bookmark"
    click_button "Delete"
    expect(page).not_to have_content("Twitter")
  end
end