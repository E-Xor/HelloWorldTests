class AuthAdminController < ApplicationController
layout 'my_book_store'
  before_filter :admin_authorize

  def index
    @total_orders = UserOrder.count
  end

end
