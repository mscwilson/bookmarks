require "database_connection"

describe DatabaseConnection do 

  it "sets up a db connection via PG" do
    expect(PG).to receive(:connect).with(dbname: "bookmark_manager_test")

    DatabaseConnection.setup("bookmark_manager_test")
  end


  describe "#query" do

    it "executes a query via PG" do
      connection = DatabaseConnection.setup("bookmark_manager_test")
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end

  end

end
