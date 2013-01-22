# config/initializers/koala.rb
# Simple approach
Koala::Facebook::OAuth.class_eval do
  def initialize_with_default_settings(*args)
    raise "application id and/or secret are not specified in the settings" unless APP_CONFIG['fb_app_id'] && APP_CONFIG['fb_secret']
    initialize_without_default_settings(APP_CONFIG['fb_app_id'], APP_CONFIG['fb_secret'], args.first)
  end 

  alias_method_chain :initialize, :default_settings 
end