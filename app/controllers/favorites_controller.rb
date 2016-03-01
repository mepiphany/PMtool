class FavoritesController < ApplicationController
  def index
    @project = current_user.favored_projects
  end

  def create
    @project = Project.find params[:project_id]
    favor = Favorite.new(project: @project, user: current_user)
    if favor.save
      redirect_to project_path(@project), notice: "Added to Favorite"
    else
      redirect_to project_path(@project), alert: "Already added to your favorite"
    end
  end

  def destroy
    project = Project.find params[:project_id]
    favor = current_user.favorites.find params[:id]
    favor.destroy
    redirect_to project_path(project), notice: "removed"
  end
end
