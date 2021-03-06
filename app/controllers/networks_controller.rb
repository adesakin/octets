class NetworksController < ApplicationController
  # GET /networks
  # GET /networks.xml
  def index
    if (params[0]) && (params[0][:arr]).empty?
      @networks = []    
      
    elsif (params[0]) && (params[0][:option] == "2")
      @temp = Network.new
      @networks = @temp.network_return(params[0][:arr])    
    
    else
      @networks = Network.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @networks }
      format.amf  { render :amf => @networks }
    end
  end
  
  def selectindex
      @networks = Network.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @networks }
      format.amf  { render :amf => @networks }
    end
  end

  # GET /networks/1
  # GET /networks/1.xml
  def show
    @network = Network.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @network }
      format.amf  { render :amf => @network }
    end
  end

  # GET /networks/new
  # GET /networks/new.xml
  def new
    @network = Network.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @network }
      format.amf  { render :amf => @network }
    end
  end

  # GET /networks/1/edit
  def edit
    @network = Network.find(params[:id])
  end

  # POST /networks
  # POST /networks.xml
  def create

    if (params[0]) && (params[0][:option] == "2")
      @temp = Network.new
      @network = @temp.network_create(params[0][:collections], params[0][:networks])
    
    else
      @network = Network.new(params[:network])
    end

    respond_to do |format|
      if @network.save
        flash[:notice] = 'Network was successfully created.'
        format.html { redirect_to(@network) }
        format.xml  { render :xml => @network, :status => :created, :location => @network }
        format.amf  { render :amf => @network, :status=> :created}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @network.errors, :status => :unprocessable_entity }
        format.amf  { render :amf => @network.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /networks/1
  # PUT /networks/1.xml
  def update
    @network = Network.find(params[:id])

    respond_to do |format|
      if @network.update_attributes(params[:network])
        flash[:notice] = 'Network was successfully updated.'
        format.html { redirect_to(@network) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @network.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /networks/1
  # DELETE /networks/1.xml
  def destroy
    @network = Network.find(params[:id])
    @network.destroy

    respond_to do |format|
      format.html { redirect_to(networks_url) }
      format.xml  { head :ok }
    end
  end
end
