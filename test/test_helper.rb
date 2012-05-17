ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def auth_login_as(user)
    session[:auth_user_id] = auth_users(user).id # auth_users is from fixtures
  end

  def auth_logout
    session.delete :auth_user_id
  end

  def setup # is called on every test
    auth_login_as :one if defined? session # session is defined only in controller tests
  end

end
