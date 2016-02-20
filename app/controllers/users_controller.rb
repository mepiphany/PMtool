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
    user_params = params.require(:user).permit([:first_name, :last_name, :email])
    if @user.update(user_params)
       redirect_to root_path, notice: "Your informations have been updated!"
    else
      render :edit
    end
  end

  def edit_password
    @user = User.find params[:id]
  end

  def update_password
    @user = User.find params[:id]
    user_params = params.require(:user).permit([:current_password, :password, :password_confirmation])
    if @user.authenticate(user_params[:current_password]) && @user.update(user_params)
      redirect_to root_path, notice: "You have changed your password"
    else
      flash[:alert] = "make sure password is correct"
      render :edit_password
    end
  end


end
