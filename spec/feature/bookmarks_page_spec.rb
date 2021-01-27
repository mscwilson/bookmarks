feature "bookmarks page" do
  scenario "shows some bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit "/bookmarks"

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

  scenario "adding a bookmark" do
    visit "/bookmarks"
    fill_in "url", with: "http://www.facebook.com"
    click_button "Add bookmark"
    expect(page).to have_content "http://www.facebook.com"
  end

end
