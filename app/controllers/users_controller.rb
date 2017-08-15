class UsersController < ApplicationController
  before_action :authorize_user, only: [:index, :destroy]

  def index
    @users = User.all
    @schools = School.all
    @classrooms = Classroom.all
  end

  def show

    @user = current_user
    @classrooms = current_user.classrooms
    @schools = current_user.schools
    @school = School.new
    @result_school = []
    @school_array = []

    if (params[:name] != '' && params[:address] == '')
      @school_array << School.search_name(params[:name])
      @result_school = (@result_school + @school_array ).uniq
    elsif (params[:name] == '' && params[:address] != '')
        @school_array << School.search_address(params[:address])
        @result_school = (@result_school + @school_array ).uniq
    elsif (params[:name] != '' && params[:address] != '')
      @school_array << School.search_name(params[:name])
      @school_array << School.search_address(params[:address])
      @result_school = (@result_school + @school_array ).uniq
      else
        @school_array = []
      end
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
