require 'test_helper'

class CdControllerTest < ActionController::TestCase
  test "should get /home/user/RailsApps/HelloWorldTests/app" do
    get :/home/user/RailsApps/HelloWorldTests/app
    assert_response :success
  end

end
