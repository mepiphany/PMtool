  class DiscussionsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

  def new
  end

  def create
    @project = Project.find params[:project_id]
      discussion_params = params.require(:discussion).permit([:title, :body])
    @discussion = Discussion.new(discussion_params)
    @discussion.project = @project
    respond_to do |format|
      if @discussion.save
        format.html {redirect_to project_path(@project)}
        format.js { render :discussion_create }
      else
        format.html {render "/projects/show"}
        format.js { render :discussion_not_create}
     end
    end
  end

  def destroy
    @project = Project.find params[:project_id]
    @discussion = Discussion.find params[:id]
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project) }
      format.js { render }
   end
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
