class AuthSessionsController < ApplicationController
layout 'my_book_store'

  def new
  end

  def create
    if user = AuthUser.authenticate(params[:user_name], params[:user_password])
      session[:auth_user_id] = user.id
      session[:auth_user_name] = params[:user_name]
      redirect_to admin_url
    elsif AuthUser.count.zero?
      redirect_to url_for(:controller => 'auth_users', :action => 'new'), :notice => "You're redirected here because there is no users in database. Please create one to make everything more secure and then sign in."
    else
      redirect_to auth_login_url, :alert => "Invalid user or password"
    end
  end

  def destroy
    session[:auth_user_id] = nil
    session[:auth_user_name] = nil
    redirect_to my_store_url
  end

end
