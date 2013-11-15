class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :except => [:index, :show, :about]
  
  def about
  end

  def all
    @dreams = Dream.where(:state => ['3', '4'])
    
    respond_to do |format|
      format.html { render 'index' }                  
      format.json  { render :json => @dreams }
    end
  end
end