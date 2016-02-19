class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit([:first_name, :last_name,
                                                :email, :password, :password_confirmation])
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Account Successfully Created!!"
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    user_params = params.require(:user).permit([:first_name, :last_nam, :email])
    @user.update(user_params)
    redirect_to root_path, notice: "Your informations have been updated!"
  end



end
