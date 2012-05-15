class AuthAdminController < ApplicationController
layout 'my_book_store'

  def index
    @total_orders = UserOrder.count
  end

end
