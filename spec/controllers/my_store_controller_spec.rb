describe MyStoreController do

  describe "GET index" do

    it "should show list of books" do
      # instead of fixtures in 'it' or 'before.each' I can use mock and stub
      get :index
      response.should be_success
      assert assigns(:my_test_scaffolds) #makes sure that a @my_test_scaffolds instance variable was set
      assert assigns(:shop_cart) #makes sure that a @shop_cart instance variable was set
    end
  end

end