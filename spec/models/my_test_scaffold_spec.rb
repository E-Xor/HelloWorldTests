describe MyTestScaffold do
  describe ".no_shop_item" do
    fixtures :my_test_scaffolds

    it "should return true if zero shop items" do
       mts = MyTestScaffold.new(:title => "NSI Book")
       mts.no_shop_item.should eq(true)
    end

    it "should return false if there are shop items" do
#       mts = MyTestScaffold.create!(:title => "NSI Book", :description => "asd", :image_url => "asd.jpg", :price => 9.99)
       mts = my_test_scaffolds(:one)
       shop_item = ShopItem.create!(:my_test_scaffold => mts)
       mts.no_shop_item.should eq(false)
    end

    it "no_shop_item should return false" do
       mts = mock("MyTestScaffold")
       mts.stub!(:no_shop_item).and_return(false)
       mts.no_shop_item.should eq(false)
    end

  end
end