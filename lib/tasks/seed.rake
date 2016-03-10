namespace :seed do

  task tasks: :environment do
    (0..20).each do |num|
      Task.create({title: Faker::Hacker.noun, project: Project.all.sample, user: User.all.sample})
    end

    (0..20).each do |num|
      Task.create({title: Faker::Hacker.noun, project: Project.all.sample, user: User.all.sample, created_at: 1.year.ago})
    end
  end

end
