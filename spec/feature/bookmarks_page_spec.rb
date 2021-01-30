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
  

  scenario "updating a bookmark" do
    Bookmark.create("http://www.makersacademy.com", "Makers Academy")
    visit "/bookmarks"
    expect(page).to have_link("Makers Academy", :href => "http://www.makersacademy.com")
    first(".bookmark").click_button "Edit"
    fill_in("url", with: "http://www.makers.tech")
    fill_in("title", with: "Makers")
    click_button "Submit"

    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link("Makers Academy", href: "http://www.makersacademy.com")
    expect(page).to have_link("Makers", href: "http://www.makers.tech")

  end


end
