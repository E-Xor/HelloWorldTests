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

  def new_my_test_scaffold(price)

    my_test_scaffold = MyTestScaffold.new(
      :title => 'Test Book',
      :description => 'Description of Test Book',
      :image_url => 'images/test.png',
      :price => price
    )

  end

  test "price must be positive" do

    nmts = new_my_test_scaffold(-1)
    assert nmts.invalid?
    # Asserted message should ge exactly like validation message, that's what we check here
    assert_equal 'must be greater than or equal to 0.01', nmts.errors[:price].join('; ')

    nmts = new_my_test_scaffold(0)
    assert nmts.invalid?
    assert_equal 'must be greater than or equal to 0.01', nmts.errors[:price].join('; ')

    assert new_my_test_scaffold(1).valid?

  end

  test "title must be unique" do

    # First instance is in the fixture
    my_test_scaffold = MyTestScaffold.new(
      :title => 'Title Five',
      :description => 'Description of title 5',
      :image_url => '/images/image5.png',
      :price => 50.99
    )
    assert !my_test_scaffold.save
    assert_equal 'has already been taken. Should be unique.', my_test_scaffold.errors[:title].join('; ')

  end

end
