class CollectionAttributesController < ApplicationController
  # GET /collection_attributes
  # GET /collection_attributes.xml
  def index
    @collection_attributes = CollectionAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collection_attributes }
    end
  end

  # GET /collection_attributes/1
  # GET /collection_attributes/1.xml
  def show
    @collection_attribute = CollectionAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @collection_attribute }
    end
  end

  # GET /collection_attributes/new
  # GET /collection_attributes/new.xml
  def new
    @collection_attribute = CollectionAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collection_attribute }
    end
  end

  # GET /collection_attributes/1/edit
  def edit
    @collection_attribute = CollectionAttribute.find(params[:id])
  end

  # POST /collection_attributes
  # POST /collection_attributes.xml
  def create
    @collection_attribute = CollectionAttribute.new(params[:collection_attribute])

    respond_to do |format|
      if @collection_attribute.save
        flash[:notice] = 'CollectionAttribute was successfully created.'
        format.html { redirect_to(@collection_attribute) }
        format.xml  { render :xml => @collection_attribute, :status => :created, :location => @collection_attribute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @collection_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /collection_attributes/1
  # PUT /collection_attributes/1.xml
  def update
    @collection_attribute = CollectionAttribute.find(params[:id])

    respond_to do |format|
      if @collection_attribute.update_attributes(params[:collection_attribute])
        flash[:notice] = 'CollectionAttribute was successfully updated.'
        format.html { redirect_to(@collection_attribute) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collection_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_attributes/1
  # DELETE /collection_attributes/1.xml
  def destroy
    @collection_attribute = CollectionAttribute.find(params[:id])
    @collection_attribute.destroy

    respond_to do |format|
      format.html { redirect_to(collection_attributes_url) }
      format.xml  { head :ok }
    end
  end
end
