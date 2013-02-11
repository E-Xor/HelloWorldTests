class FrogsController < ApplicationController
  # GET /frogs
  # GET /frogs.json
  def index
    @frogs = Frog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frogs }
    end
  end

  # GET /frogs/1
  # GET /frogs/1.json
  def show
    @frog = Frog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @frog }
    end
  end

  # GET /frogs/new
  # GET /frogs/new.json
  def new
    @frog = Frog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @frog }
    end
  end

  # GET /frogs/1/edit
  def edit
    @frog = Frog.find(params[:id])
  end

  # POST /frogs
  # POST /frogs.json
  def create
    @frog = Frog.new(params[:frog])

    respond_to do |format|
      if @frog.save
        format.html { redirect_to @frog, notice: 'Frog was successfully created.' }
        format.json { render json: @frog, status: :created, location: @frog }
      else
        format.html { render action: "new" }
        format.json { render json: @frog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /frogs/1
  # PUT /frogs/1.json
  def update
    @frog = Frog.find(params[:id])

    respond_to do |format|
      if @frog.update_attributes(params[:frog])
        format.html { redirect_to @frog, notice: 'Frog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @frog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frogs/1
  # DELETE /frogs/1.json
  def destroy
    @frog = Frog.find(params[:id])
    @frog.destroy

    respond_to do |format|
      format.html { redirect_to frogs_url }
      format.json { head :no_content }
    end
  end
end
