class UserSessionsController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  #before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def index
    @user_session = UserSession.new
  end
  
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      if is_amf
        @user = User.find :all, :conditions => {:login => params[:login]}
        respond_to do |format|
          format.amf  { render :amf => @user }
        end
      else
        flash[:notice] = "Login successful!"
        redirect_to collections_url
  #    redirect_back_or_default account_url
      end
    else
      render :action => :new
    end
  end
  
  def destroy
    @user_session = UserSession.find  
    @user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to login_url
  end
end
