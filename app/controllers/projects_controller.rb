class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @projects = Project.all

  end

  def new
    @project = Project.new
  end

  def create
    project_params
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project), notice: "New project has been added!!"
    else
      flash[:alert] = "Your project is not added, check the errors below"
      render :new
    end

  end

  def show
    @project = Project.find params[:id]
    @task = Task.new
    @discussion = Discussion.new
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    project_params
    @project = Project.find params[:id]
    if @project.update(project_params)
       redirect_to project_path(@project), notice: "Your project has been updated"
    else
       flash[:alert] = "Your project is not updated, check the errors below"
       render :edit
    end


  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
    redirect_to projects_path, notice: "Your Project has been removed!!"
  end

  private

  def project_params
    project_params = params.require(:project).permit([:title, :description, :due_date])
  end



end
