feature "bookmarks page" do
  scenario "shows some bookmarks" do
    truncate_test_table
    add_test_url
    allow(Bookmark).to receive(:all).and_return(Bookmark.all('bookmark_manager_test'))
    visit "/bookmarks"
    expect(page).to have_content "http://www.makersacademy.com"
  end

end
