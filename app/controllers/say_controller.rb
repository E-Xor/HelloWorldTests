class SayController < ApplicationController
  def hello
    @timenow = Time.now
    @files = Dir.glob('*')
    @current_file = __FILE__
    @current_dir = File.dirname(__FILE__)
    cookies[:good_bye] = { :value => "Cookie for goodbye", :expires => 1.hour.from_now }
    session[:good_bye] = "Session for goodbye"
  end

  def goodbye
    @cookie = ''
    @cookie = cookies[:good_bye] if cookies[:good_bye]
    @sess = ''
    @sess = session[:good_bye] if session[:good_bye]

  end

end
