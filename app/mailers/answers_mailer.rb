class AnswersMailer < ApplicationMailer

  def notify_discussion_owner(comment)
    @project = comment.discussion.project
    @comment = comment
    @discussion = comment.discussion
    @owner = @discussion.user
    mail(to: @owner.email, subject: "You've got a comment!")
  end


end
