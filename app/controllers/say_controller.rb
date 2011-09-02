class SayController < ApplicationController
  def hello
    @timenow = Time.now
    @files = Dir.glob('*')
    @current_file = __FILE__
    @current_dir = File.dirname(__FILE__)
  end

  def goodbye
  end

end
