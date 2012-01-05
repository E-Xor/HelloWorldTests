class ShopItemsController < ApplicationController
  # GET /shop_items
  # GET /shop_items.xml
  def index
    @shop_items = ShopItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shop_items }
    end
  end

  # GET /shop_items/1
  # GET /shop_items/1.xml
  def show
    @shop_item = ShopItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shop_item }
    end
  end

  # GET /shop_items/new
  # GET /shop_items/new.xml
  def new
    @shop_item = ShopItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shop_item }
    end
  end

  # GET /shop_items/1/edit
  def edit
    @shop_item = ShopItem.find(params[:id])
  end

  # POST /shop_items
  # POST /shop_items.xml
  def create
    @shop_item = ShopItem.new(params[:shop_item])

    @shop_cart = current_shop_cart # method in application_controller.rb
    my_test_scaffold = MyTestScaffold.find(params[:my_test_scaffold_id])
#    @shop_item = @shop_cart.shop_items.build(:my_test_scaffold => my_test_scaffold)
    # ShopCart has many ShopItems, i.e. ShopItem has field shop_cart_id
    # .build adds record to :has_many releationship before save
    @shop_item = @shop_cart.add_test_scaffold(my_test_scaffold.id)

    respond_to do |format|
      if @shop_item.save
        format.html { redirect_to(@shop_item.shop_cart)}#, :notice => 'Shop item was successfully created!') } # .cart is added to @shop_item
        format.xml  { render :xml => @shop_item, :status => :created, :location => @shop_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shop_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shop_items/1
  # PUT /shop_items/1.xml
  def update
    @shop_item = ShopItem.find(params[:id])

    respond_to do |format|
      if @shop_item.update_attributes(params[:shop_item])
        format.html { redirect_to(@shop_item, :notice => 'Shop item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shop_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_items/1
  # DELETE /shop_items/1.xml
  def destroy
    @shop_item = ShopItem.find(params[:id])

    @shop_item.quantity -= 1
    if @shop_item.quantity == 0
      @shop_item.destroy
    else
      @shop_item.save
    end

    respond_to do |format|
     if @shop_item.shop_cart
        format.html { redirect_to(@shop_item.shop_cart) }
        format.xml  { head :ok }
      else
        format.html { redirect_to(my_store_path) }
        format.xml  { render :xml => @shop_item.errors, :status => :unprocessable_entity }
      end
    end
  end
end
