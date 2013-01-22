class FbUsersController < ApplicationController

  before_filter :current_user

  def current_user
    return if @current_user

    begin
      # allow for ?access_token=[TOKEN] for iOS calls.
      @access_token = params[:access_token] || session[:access_token]
      @graph = Koala::Facebook::API.new(@access_token)
      @current_user ||= @graph.get_object('me', { fields: 'id,first_name,last_name,email' })

      # Save user info
      existing_user = FbUser.find_by_graph_id(@current_user["id"])
      if existing_user and existing_user.access_token.to_s != @access_token.to_s
        existing_user.access_token = @access_token 
        existing_user.save!
      end
      unless existing_user
        FbUser.create!(
          :graph_id => @current_user["id"],
          :first_name => @current_user["first_name"],
          :last_name => @current_user["last_name"],
          :email => @current_user["email"],
          :access_token => @access_token
        )
      end
    rescue
      nil # not logged in
    end
  end

  # GET /fb_users
  # GET /fb_users.json
  def index

    # Authentication
    @oauth_redirect_url = request.url
    if params[:code]
      session[:access_token] = Koala::Facebook::OAuth.new(@oauth_redirect_url).get_access_token(params[:code])
      redirect_to "#{request.protocol}#{request.host_with_port}#{request.path}" and return
    end

    @fb_user = FbUser.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @fb_user }
    end
  end

end
