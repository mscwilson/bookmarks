feature "bookmarks page" do
  scenario "shows some bookmarks" do
    insert_three_bookmarks
    visit "/bookmarks"

    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Destroy All Software"
    expect(page).to have_content "Google"
  end

  scenario "adding a bookmark" do
    visit "/bookmarks"
    fill_in "url", with: "http://www.twitter.com"
    fill_in "title", with: "Twitter"
    click_button "Add bookmark"
    expect(page).to have_content "Twitter"
  end

  scenario "showing Title link" do
    visit "/bookmarks"
    fill_in "url", with: "http://www.twitter.com"
    fill_in "title", with: "Twitter"
    click_button "Add bookmark"
    expect(page).to have_link("Twitter", :href => "http://www.twitter.com")
  end
  



end
