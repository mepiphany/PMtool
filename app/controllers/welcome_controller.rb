class WelcomeController < ApplicationController
  def index
    @projects = Project.all
    @tasks = Task.all
  end

end
