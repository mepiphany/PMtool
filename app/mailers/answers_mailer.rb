class AnswersMailer < ApplicationMailer

  def notify_discussion_owner(comment)
    @project = comment.discussion.project
    @comment = comment
    @discussion = comment.discussion
    @owner = @discussion.user
    mail(to: @owner.email, subject: "You've got a comment!")
  end

  def notify_task_owner(task)
    @task = task
    @owner = @task.user
    mail(to: @owner.email, subject: "You've got a completed task")
  end
end
