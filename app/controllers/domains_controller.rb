class DomainsController < ApplicationController
  
  # return all Domains
  def find_all
    respond_to do |format|
      format.amf  { render :amf => Domain.find(:all) }
    end
  end
  
  # return a single Domain by id
  # expects id in params[0]
  def find_by_id
    respond_to do |format|
      format.amf { render :amf => Domain.find(params[0]) }
    end
  end

  # saves new or updates existing Domain
  # expect params[0] to be incoming Domain
  def save
    respond_to do |format|
      format.amf do
        @domain = params[0]

        if @domain.save
          render :amf => @domain
        else
          render :amf => FaultObject.new(@domain.errors.full_messages.join('\n'))
        end
      end
    end
  end

  # destroy a Domain
  # expects id in params[0]
  def destroy
    respond_to do |format|
      format.amf do
        @domain = Domain.find(params[0])
        @domain.destroy

        render :amf => true
      end
    end
  end

end
