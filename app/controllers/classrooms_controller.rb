class ClassroomsController < ApplicationController
 before_action :authorize_user


  def index
    @classrooms = Classroom.all
    @user = current_user

  end
  def show
    @classroom = Classroom.find(params[:id])
  end
  def create
    binding.pry
  end


  private

  def classroom_params
    params.require(:classroom).permit(:subject, :grade, :class_number)
  end

  def authorize_user
    if !user_signed_in?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
