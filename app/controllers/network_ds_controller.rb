class NetworkDsController < ApplicationController
  # GET /network_ds
  # GET /network_ds.xml
  def index
    @network_ds = NetworkD.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @network_ds }
    end
  end

  # GET /network_ds/1
  # GET /network_ds/1.xml
  def show
    @network_d = NetworkD.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @network_d }
    end
  end

  # GET /network_ds/new
  # GET /network_ds/new.xml
  def new
    @network_d = NetworkD.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @network_d }
    end
  end

  # GET /network_ds/1/edit
  def edit
    @network_d = NetworkD.find(params[:id])
  end

  # POST /network_ds
  # POST /network_ds.xml
  def create
    @network_d = NetworkD.new(params[:network_d])

    respond_to do |format|
      if @network_d.save
        flash[:notice] = 'NetworkD was successfully created.'
        format.html { redirect_to(@network_d) }
        format.xml  { render :xml => @network_d, :status => :created, :location => @network_d }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @network_d.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /network_ds/1
  # PUT /network_ds/1.xml
  def update
    @network_d = NetworkD.find(params[:id])

    respond_to do |format|
      if @network_d.update_attributes(params[:network_d])
        flash[:notice] = 'NetworkD was successfully updated.'
        format.html { redirect_to(@network_d) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @network_d.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /network_ds/1
  # DELETE /network_ds/1.xml
  def destroy
    @network_d = NetworkD.find(params[:id])
    @network_d.destroy

    respond_to do |format|
      format.html { redirect_to(network_ds_url) }
      format.xml  { head :ok }
    end
  end
end
