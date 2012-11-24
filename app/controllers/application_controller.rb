class ApplicationController < ActionController::Base
  protect_from_forgery
 
  before_filter :authenticate_user!, :except => [:index, :show, :about]
 
  before_filter :count_dreams
  
  def about
  end

  protected
    def count_dreams
      @num_private = Dream.where(:state => '0').count.to_s
      @num_published = Dream.where(:state => '1').count.to_s
      @num_all_my = Dream.where(:state => ['0', '1']).count.to_s
    end
end
