class MyTestScaffoldsController < ApplicationController
  layout 'my_book_store'
  before_filter :admin_authorize

  # GET /my_test_scaffolds
  # GET /my_test_scaffolds.xml
  def index
    @my_test_scaffolds = MyTestScaffold.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @my_test_scaffolds }
    end
  end

  # GET /my_test_scaffolds/1
  # GET /my_test_scaffolds/1.xml
  def show
    @my_test_scaffold = MyTestScaffold.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @my_test_scaffold }
    end
  end

  # GET /my_test_scaffolds/new
  # GET /my_test_scaffolds/new.xml
  def new
    @my_test_scaffold = MyTestScaffold.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @my_test_scaffold }
    end
  end

  # GET /my_test_scaffolds/1/edit
  def edit
    @my_test_scaffold = MyTestScaffold.find(params[:id])
  end

  # POST /my_test_scaffolds
  # POST /my_test_scaffolds.xml
  def create
    @my_test_scaffold = MyTestScaffold.new(params[:my_test_scaffold])

    respond_to do |format|
      if @my_test_scaffold.save
        format.html { redirect_to(@my_test_scaffold, :notice => 'My test scaffold was successfully created.') }
        format.xml  { render :xml => @my_test_scaffold, :status => :created, :location => @my_test_scaffold }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @my_test_scaffold.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /my_test_scaffolds/1
  # PUT /my_test_scaffolds/1.xml
  def update
    @my_test_scaffold = MyTestScaffold.find(params[:id])

    respond_to do |format|
      if @my_test_scaffold.update_attributes(params[:my_test_scaffold])
        format.html { redirect_to(@my_test_scaffold, :notice => 'My test scaffold was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @my_test_scaffold.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /my_test_scaffolds/1
  # DELETE /my_test_scaffolds/1.xml
  def destroy
    @my_test_scaffold = MyTestScaffold.find(params[:id])
    @my_test_scaffold.destroy

    respond_to do |format|
      format.html { redirect_to(my_test_scaffolds_url) }
      format.xml  { head :ok }
    end
  end

  def who_bought_this
    @my_test_scaffold = MyTestScaffold.find(params[:id])

    respond_to do |format|
      format.atom # see ../views/who_bought_this.atom.builder
#      format.xml { render :xml => @my_test_scaffold }
      format.xml
      format.html
    end
  end
end
