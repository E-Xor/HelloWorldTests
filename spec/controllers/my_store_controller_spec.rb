require 'spec_helper'

describe MyStoreController do

  describe "GET index" do
#    fixtures :my_test_scaffolds

    it "should show list of books" do
      # instead of fixteures in 'it' or 'before.each' I can use mock and stub
#      mts = mock_model(MyTestScaffold)
#      MyTestScaffold.stub(:all) { [mts] }

      get :index
      response.should be_success
#puts "Resopnse body: #{response.body}"
#puts "Resopnse: #{response}"
#      response.body.should =~ /Title Five/ #include_text
    end
  end

end