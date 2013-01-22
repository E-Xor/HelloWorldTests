class FbUsersController < ApplicationController
  # GET /fb_users
  # GET /fb_users.json
  def index
    @fb_user = FbUser.all
    #@current_user = 'Current User'

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @fb_user }
    end
  end

end
