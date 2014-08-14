class NetworkAllocationsController < ApplicationController
  # GET /network_allocations
  # GET /network_allocations.xml
  def index
    @network_allocations = NetworkAllocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @network_allocations }
    end
  end

  # GET /network_allocations/1
  # GET /network_allocations/1.xml
  def show
    @network_allocation = NetworkAllocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @network_allocation }
    end
  end

  # GET /network_allocations/new
  # GET /network_allocations/new.xml
  def new
    @network_allocation = NetworkAllocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @network_allocation }
    end
  end

  # GET /network_allocations/1/edit
  def edit
    @network_allocation = NetworkAllocation.find(params[:id])
  end

  # POST /network_allocations
  # POST /network_allocations.xml
  def create
    @network_allocation = NetworkAllocation.new(params[:network_allocation])

    respond_to do |format|
      if @network_allocation.save
        flash[:notice] = 'NetworkAllocation was successfully created.'
        format.html { redirect_to(@network_allocation) }
        format.xml  { render :xml => @network_allocation, :status => :created, :location => @network_allocation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @network_allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /network_allocations/1
  # PUT /network_allocations/1.xml
  def update
    @network_allocation = NetworkAllocation.find(params[:id])

    respond_to do |format|
      if @network_allocation.update_attributes(params[:network_allocation])
        flash[:notice] = 'NetworkAllocation was successfully updated.'
        format.html { redirect_to(@network_allocation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @network_allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /network_allocations/1
  # DELETE /network_allocations/1.xml
  def destroy
    @network_allocation = NetworkAllocation.find(params[:id])
    @network_allocation.destroy

    respond_to do |format|
      format.html { redirect_to(network_allocations_url) }
      format.xml  { head :ok }
    end
  end
end
