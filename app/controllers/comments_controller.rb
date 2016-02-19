class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new

  end

  def create
    @discussion = Discussion.find params[:discussion_id]
    comments_params = params.require(:comment).permit([:body])
    @comment = @discussion.comments.new(comments_params)
    @comment.save
    redirect_to project_path(@discussion.project)
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
    redirect_to project_path(@discussion.project)

  end

end
