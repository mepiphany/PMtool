class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
  end

  def create
    task_params = params.require(:task).permit(:title, :due_date)
    @project = Project.find params[:project_id]
    @task = Task.new(task_params)
    @task.project = @project
    @task.user = current_user
    respond_to do |format|
    if @task.save
       format.html {redirect_to project_path(@project), notice: "Task created!"}
       format.js { render :successful_task }
     else
       format.html {redirect_to project_path(@project), alert: "Task is not created!"}
       format.js { render :unsuccessful_task }
     end
   end
  end

  def update
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    mark_done_params = params.require(:task).permit(:status)
    @task.update mark_done_params
    respond_to do |format|
      format.html {redirect_to project_path(@project)}
      format.js { render }
   end
  end

  def destroy
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    @task.destroy
    respond_to do |format|
      format.html {redirect_to project_path(@project)}
      format.js { render }
  end
 end
end
