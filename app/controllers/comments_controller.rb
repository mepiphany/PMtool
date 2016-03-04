class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.find params[:discussion_id]
    comments_params = params.require(:comment).permit([:body])
    @comment = @discussion.comments.new(comments_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_discussion_path(@discussion.project, @discussion) }
        format.js { render :comment_successful }
      else
        format.js { render :comment_unsuccessful }
      end
    end
  end

  def edit
    @discussion = Discussion.find params[:discussion_id]
    @comment = Comment.find params[:id]
  end

  def update
    @discussion = Discussion.find params[:discussion_id]
    comments_params = params.require(:comment).permit([:body])
    @comment = Comment.find params[:id]
    @comment.update(comments_params)
    redirect_to project_path(@discussion.project)
  end

  def destroy
    @discussion = Discussion.find params[:discussion_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
    format.html { redirect_to project_discussion_path(@discussion.project, @discussion) }
    format.js { render }
   end
  end
end
