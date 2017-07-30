class UsersController < ApplicationController
  before_action :authorize_user, except: [:index, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed!'
  end

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
