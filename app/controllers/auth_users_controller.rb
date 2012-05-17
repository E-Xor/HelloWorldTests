class AuthUsersController < ApplicationController
layout 'my_book_store'
  # GET /auth_users
  # GET /auth_users.xml
  def index
#    @auth_users = AuthUser.all
    @auth_users = AuthUser.order(:user_name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @auth_users }
    end
  end

  # GET /auth_users/1
  # GET /auth_users/1.xml
  def show
    @auth_user = AuthUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @auth_user }
    end
  end

  # GET /auth_users/new
  # GET /auth_users/new.xml
  def new
    @auth_user = AuthUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @auth_user }
    end
  end

  # GET /auth_users/1/edit
  def edit
    @auth_user = AuthUser.find(params[:id])
  end

  # POST /auth_users
  # POST /auth_users.xml
  def create
    @auth_user = AuthUser.new(params[:auth_user])

    respond_to do |format|
      if @auth_user.save
#        format.html { redirect_to(@auth_user, :notice => 'Auth user was successfully created.') }
        format.html { redirect_to(auth_users_url, :notice => "User #{@auth_user.user_name} was successfully created.") }
        format.xml  { render :xml => @auth_user, :status => :created, :location => @auth_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @auth_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /auth_users/1
  # PUT /auth_users/1.xml
  def update
    @auth_user = AuthUser.find(params[:id])

    respond_to do |format|
      if @auth_user.update_attributes(params[:auth_user])
#        format.html { redirect_to(@auth_user, :notice => 'Auth user was successfully updated.') }
        format.html { redirect_to(auth_users_url, :notice => "User #{@auth_user.user_name} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @auth_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_users/1
  # DELETE /auth_users/1.xml
  def destroy
    begin
      @auth_user = AuthUser.find(params[:id])
      @auth_user.destroy
      flash[:notice] = "User #{@auth_user.user_name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to(auth_users_url) }
      format.xml  { head :ok }
    end
  end
end
