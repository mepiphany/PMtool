namespace :summary do
  desc "TODO"
  task new_tasks: :environment do
    @results = {}
    @users = []

    tasks_today = Task.where("created_at >= ?", Time.zone.now.beginning_of_day)

    tasks_today.each do |task|
      user = task.project.user
      @users << user
      @results[user.id] ||= ""
      @results[user.id] << "#{task.id} #{task.title} \n"
    end
     @users.uniq.each do |user|
       ProjectSummaryMailer.notify_project_owner(user, @results[user.id]).deliver_now
     end
  end

  desc "TODO"
  task new_discussions: :environment do
  end
end
