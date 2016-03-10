class TasksMailer < ApplicationMailer
  def notify_task_owner(task)
    @task = task
    @owner = @task.user
    mail(to: @owner.email, subject: "You've got a completed task")
  end
end
