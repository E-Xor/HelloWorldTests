class MyStoreController < ApplicationController
  layout 'my_book_store'

  def index
    @my_test_scaffolds = MyTestScaffold.all
  end

end
