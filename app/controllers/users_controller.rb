class UsersController < ApplicationController
  before_action :authorize_user, only: [:index, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed!'
  end

  # def generate_new_password_email user = User.find(params[:user_id])
  #   user.send_reset_password_instructions flash[:notice] = "Reset password instructions have been sent to #{user.email}."
  #   redirect_to admin_user_path(user)
  # end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :profile_photo)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
