class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
  end

  def create
    @project = Project.find params[:project_id]
    task_params = params.require(:task).permit(:title, :due_date)
    @task = Task.new(task_params)
    @task.project = @project
    @task.save
    redirect_to project_path(@project)
  end

  def update
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    mark_done_params = params.require(:task).permit(:status)
    @task.update mark_done_params
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    @task.destroy
    redirect_to project_path(@project)
  end






end
