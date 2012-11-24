class RatingsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @dream = Dream.find(params[:dream_id])
    @rating = @dream.ratings.build(params[:rating])
    @rating.user = current_user
    
    respond_to do |format|
      if @dream.state == 1
        if @rating.save
          format.html { redirect_to(@dream, :notice => 'Thank you for rating this dream!') }
        else
          format.html { redirect_to(@dream, :notice => 'There was an error saving your rating.') }
        end  
      else
        format.html { redirect_to(@dream, :notice => 'Ratings are limited to published dreams only.') }
      end  
    end    
  end

  def update
    @rating = current_user.ratings.find(params[:id])
    @dream = Dream.find(params[:dream_id])

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        format.html { redirect_to(@dream, :notice => 'Thank you for updating your rating!') }
      else
        format.html { redirect_to(@dream, :notice => 'There was an error saving your rating.') }
      end  
    end
  end

  def destroy
    @rating = current_user.ratings.find(params[:id])
    @dream = Dream.find(params[:dream_id])
    
    @rating.destroy
    
    respond_to do |format|
      format.html { redirect_to @dream }
    end
  end
end
