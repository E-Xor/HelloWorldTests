require 'test_helper'

class MyStoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', :minimum => 3 # Menu items
    assert_select '#main .entry', 2 # Books in store (from fixtures)
    assert_select 'h3', 'Title Six' # At leat one book title (from fixtures)
    assert_select '.price', /\$[,\d]+\.\d\d/ # Price format
  end

end
