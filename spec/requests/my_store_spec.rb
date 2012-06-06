describe "My Store" do
#  fixtures :my_test_scaffolds # No need, they will be loaded

  it "should show books" do
    get my_store_path
    response.should be_success
    response.body.should include("Title Five")
  end
end