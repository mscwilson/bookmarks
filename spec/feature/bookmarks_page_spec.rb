feature "bookmarks page" do
  scenario "shows some bookmarks" do
    insert_three_bookmarks
    visit "/bookmarks"

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

  scenario "adding a bookmark" do
    visit "/bookmarks"
    fill_in "url", with: "http://www.twitter.com"
    click_button "Add bookmark"
    expect(page).to have_content "http://www.twitter.com"
  end

end
