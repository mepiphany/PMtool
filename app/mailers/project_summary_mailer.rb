class ProjectSummaryMailer < ApplicationMailer
  def notify_project_owner(user, result)
    @user = user
    @result = result
    puts "#{user.email}"
    mail(to: @user.email, subject: "your summary")
  end
end
