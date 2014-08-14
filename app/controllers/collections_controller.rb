class CollectionsController < ApplicationController
  # GET /collections
  # GET /collections.xml
  def index
    @collections = Collection.all :order=>'name'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collections }
      format.amf  { render :amf => @collections }
    end
  end



  # GET /collections/arrange
  # GET /collections.xml
  def arrange
    @collections = Collection.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collections }
      format.amf  { render :amf => @collections }
    end
  end



  # GET /collections/1
  # GET /collections/1.xml
  def show
    @collection = Collection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @collection }
      format.amf  { render :amf => @collection }
    end
  end

  def newchild
    @child = params[0]
    @child.save
    @child.update_attribute :parent_id, (params[0][:parent_id])
    respond_to do |format|
  #    format.html # show.html.erb
      format.xml  { render :xml => @child }
      format.amf  { render :amf => @child }
    end
  end

  # GET /collections/new
  # GET /collections/new.xml
  def new
    @collection = Collection.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collection }
      format.amf {render :amf=> @collection }
      
    end
  end

  # GET /collections/1/edit
  def edit
    @collection = Collection.find(params[:id])
  end


  # POST /collections
  # POST /collections.xml
  def create
    if is_amf
      @collection =  Collection.new(params[0])
    #  @collection.update_attributes(params[0])
     else
       @collection = Collection.new(params[:collection])
    end

    respond_to do |format|
      if @collection.save
        flash[:notice] = 'Collection was successfully created.'
        format.html { redirect_to(@collection) }
        format.xml  { render :xml => @collection, :status => :created, :location => @collection }
        format.amf {render :amf =>"Collection Saved"}
      else
        format.html { render :action => "new"}
        format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
        format.amf {render :amf => @collection.errors}
      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.xml
  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        flash[:notice] = 'Collection was successfully updated.'
        format.html { redirect_to(@collection) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.xml
  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to(collections_url) }
      format.xml  { head :ok }
    end
  end
end
