require 'test_helper'

class MyTestScaffoldTest < ActiveSupport::TestCase

  test "fields must not be empty " do
    my_test_scaffold = MyTestScaffold.new
    assert my_test_scaffold.invalid?
    assert my_test_scaffold.errors[:title].any?
    assert my_test_scaffold.errors[:description].any?
    assert my_test_scaffold.errors[:price].any?
    assert my_test_scaffold.errors[:image_url].any?
  end

end
