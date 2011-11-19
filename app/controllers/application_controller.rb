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
