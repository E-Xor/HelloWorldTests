class UserOrdersController < ApplicationController
layout 'my_book_store'
  # GET /user_orders
  # GET /user_orders.xml
  def index
    @user_orders = UserOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_orders }
    end
  end

  # GET /user_orders/1
  # GET /user_orders/1.xml
  def show
    @user_order = UserOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_order }
    end
  end

  # GET /user_orders/new
  # GET /user_orders/new.xml
  def new
    if current_shop_cart.shop_items.empty?
      redirect_to my_store_url, :notice => "Your cart is empty"
      return
    end
    @user_order = UserOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_order }
    end
  end

  # GET /user_orders/1/edit
  def edit
    @user_order = UserOrder.find(params[:id])
  end

  # POST /user_orders
  # POST /user_orders.xml
  def create
    @user_order = UserOrder.new(params[:user_order])
    @user_order.add_shop_items_from_user_cart(current_shop_cart)

    respond_to do |format|
      if @user_order.save
        ShopCart.destroy(session[:shop_cart_id])
        session[:shop_cart_id] = nil
        format.html { redirect_to(my_store_url, :notice => "Thanks for the order, #{@user_order.user_name}.") }
        format.xml  { render :xml => @user_order, :status => :created, :location => @user_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_orders/1
  # PUT /user_orders/1.xml
  def update
    @user_order = UserOrder.find(params[:id])

    respond_to do |format|
      if @user_order.update_attributes(params[:user_order])
        format.html { redirect_to(@user_order, :notice => 'User order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_orders/1
  # DELETE /user_orders/1.xml
  def destroy
    @user_order = UserOrder.find(params[:id])
    @user_order.destroy

    respond_to do |format|
      format.html { redirect_to(user_orders_url) }
      format.xml  { head :ok }
    end
  end
end
