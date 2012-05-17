class ApplicationController < ActionController::Base
  protect_from_forgery

private

def current_shop_cart
  ShopCart.find(session[:shop_cart_id])
  rescue
    shop_cart = ShopCart.create
    session[:shop_cart_id] = shop_cart.id
    shop_cart
  end
end

def admin_authorize
  unless AuthUser.find_by_id(session[:auth_user_id])
    redirect_to auth_login_url, :notice => "Please log in"
  end
end
