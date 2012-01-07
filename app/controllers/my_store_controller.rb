class MyStoreController < ApplicationController
  layout 'my_book_store'

  def index
    @my_test_scaffolds = MyTestScaffold.all
    @shop_cart = current_shop_cart # method from aplication controller
    session[:hit_counter] ||= 0
    session[:hit_counter] += 1
  end

end
