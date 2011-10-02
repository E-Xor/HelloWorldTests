require 'test_helper'

class MyTestScaffoldsTest < ActionController::TestCase

  setup do
    @controller = MyTestScaffoldsController.new
#    @my_test_scaffold = my_test_scaffolds(:one)
    @update = {
      :title => 'In Controller Test',
      :description => 'Description in controller test',
      :image_url => '/images/ct.png',
      :price => 11.99
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_test_scaffolds)
  end

  test "shoudl get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('MyTestScaffold.count') do
      post :create, :my_test_scaffold => @update
    end
    assert_redirected_to my_test_scaffold_path(assigns(:my_test_scaffold))
  end

end
