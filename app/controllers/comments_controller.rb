class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @dream = Dream.find(params[:dream_id])
    @comment = @dream.comments.build(params[:comment])
    @comment.user = current_user

    respond_to do |format|
      if @dream.state > 2
        if @comment.save
          format.html { redirect_to(@dream, :notice => 'Your comment was successfully saved.') }
        else
          format.html { redirect_to(@dream, :notice => 'There was an error saving your comment.') }
        end
      else
        format.html { redirect_to(@dream, :notice => 'Comments are limited to published dreams.') }
      end
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @dream = Dream.find(params[:dream_id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @dream }
    end
  end
end
