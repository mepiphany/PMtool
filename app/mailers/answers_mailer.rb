class AnswersMailer < ApplicationMailer

  def notify_discussion_owner(comment)
    @discussion = discussion
    @project = project
  

  end
end
