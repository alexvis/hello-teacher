class ClassroomsController < ApplicationController
 before_action :authorize_user


  def index
    @classrooms = Classroom.all
    @classroom = Classroom.new

  end

  def show
    @classroom = Classroom.find(params[:id])
  end

  def create
    @classroom = Classroom.new(classroom_params)
    @school = @classroom.school_id
    @user_id = current_user.id
    if @classroom.save
      redirect_to "/users/@user_id/schools/@school/classrooms"
    else
      render 'index'
    end
  end

  def new
    @classroom = Classroom.new
  end

  def destroy
    classroom = Classroom.find(params[:id])
    classroom.destroy
    redirect_to users_path, notice: 'User was successfully destroyed!'
  end

  private

  def classroom_params
    params.require(:classroom).permit(:subject, :grade, :class_number, :user_id, :school_id)
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
