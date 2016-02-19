  class DiscussionsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

  def new
  end

  def create
    @project = Project.find params[:project_id]
      discussion_params = params.require(:discussion).permit([:title, :body])
    @discussion = Discussion.new(discussion_params)
    @discussion.project = @project
    @discussion.save
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find params[:project_id]
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    redirect_to project_path(@project)
  end

  def edit
    @project = Project.find params[:project_id]
    @discussion = Discussion.find params[:id]
  end

  def update

    @project = Project.find params[:project_id]
    discussion_params = params.require(:discussion).permit([:title, :body])
    @discussion = Discussion.find params[:id]
    @discussion.update(discussion_params)
    redirect_to project_path(@project)

  end



end
