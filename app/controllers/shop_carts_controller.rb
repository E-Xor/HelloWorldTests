class ShopCartsController < ApplicationController
  layout 'my_book_store'
  # GET /shop_carts
  # GET /shop_carts.xml
  def index
    @shop_carts = ShopCart.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shop_carts }
    end
  end

  # GET /shop_carts/1
  # GET /shop_carts/1.xml
  def show
    @shop_cart = ShopCart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shop_cart }
    end
  end

  # GET /shop_carts/new
  # GET /shop_carts/new.xml
  def new
    @shop_cart = ShopCart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shop_cart }
    end
  end

  # GET /shop_carts/1/edit
  def edit
    @shop_cart = ShopCart.find(params[:id])
  end

  # POST /shop_carts
  # POST /shop_carts.xml
  def create
    @shop_cart = ShopCart.new(params[:shop_cart])

    respond_to do |format|
      if @shop_cart.save
        format.html { redirect_to(@shop_cart, :notice => 'Shop cart was successfully created.') }
        format.xml  { render :xml => @shop_cart, :status => :created, :location => @shop_cart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shop_cart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shop_carts/1
  # PUT /shop_carts/1.xml
  def update
    @shop_cart = ShopCart.find(params[:id])

    respond_to do |format|
      if @shop_cart.update_attributes(params[:shop_cart])
        format.html { redirect_to(@shop_cart, :notice => 'Shop cart was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shop_cart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_carts/1
  # DELETE /shop_carts/1.xml
  def destroy
    @shop_cart = ShopCart.find(params[:id])
    @shop_cart.destroy

    respond_to do |format|
      format.html { redirect_to(shop_carts_url) }
      format.xml  { head :ok }
    end
  end
end
