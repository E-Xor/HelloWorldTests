describe MyStoreController do

  describe "GET index" do

    it "should show list of books" do
      # instead of fixteures in 'it' or 'before.each' I can use mock and stub
      get :index
      response.should be_success
    end
  end

end