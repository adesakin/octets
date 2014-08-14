class NetworkDetailsController < ApplicationController
  # GET /network_details
  # GET /network_details.xml
  def index
    @network_details = Subnet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @network_details }
    end
  end
  
  # GET /network_details/1
  # GET /network_details/1.xml
  def show
    @network_detail = Subnet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @network_detail }
    end
  end

  # GET /network_details/new
  # GET /network_details/new.xml
  def new
    @network_detail = Subnet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @network_detail }
    end
  end

  # GET /network_details/1/edit
  def edit
    @network_detail = NetworkDetail.find(params[:id])
  end

  # POST /network_details
  # POST /network_details.xml
  def create
    if (params[0]) && (params[0][:option] == "2")
    	(params[0][:network_details]).each do |net|
    	  @network_detail = NetworkDetail.create :parent_id=>(net.parent_id), :network_address => net.network_address, :description => net.description
    	#	@network_detail.network_address => net.network_address
    	#	@network_detail.description => net.description
    	#	@network_detail.note =< net.note
    	#	@network_detail.parent_id = net.parent_id
    	#	@network_detail.updated_by = net.updated_by
    		@network_detail.save
    #	  @network_detail.update_attribute :parent_id, (net.parent_id)
    	end
    
    else
      @network_detail = NetworkDetail.new(params[:network_detail])
    end

    respond_to do |format|
      if @network_detail.save
        flash[:notice] = 'NetworkDetail was successfully created.'
        format.html { redirect_to(@network_detail) }
        format.xml  { render :xml => @network_detail, :status => :created, :location => @network_detail }
        format.amf  { render :amf => @network_detail, :status => :created, :location => @network_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @network_detail.errors, :status => :unprocessable_entity }
        format.amf  { render :amf => @network_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /network_details/1
  # PUT /network_details/1.xml
  def update
    @network_detail = NetworkDetail.find(params[:id])

    respond_to do |format|
      if @network_detail.update_attributes(params[:network_detail])
        flash[:notice] = 'NetworkDetail was successfully updated.'
        format.html { redirect_to(@network_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @network_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /network_details/1
  # DELETE /network_details/1.xml
  def destroy
    @network_detail = NetworkDetail.find(params[:id])
    @network_detail.destroy

    respond_to do |format|
      format.html { redirect_to(network_details_url) }
      format.xml  { head :ok }
    end
  end
end
