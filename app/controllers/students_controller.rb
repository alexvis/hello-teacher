class StudentsController < ApplicationController
  before_action :authorize_user

  def index
  end

  def show
    @student = Student.new
    @user_id = params["user_id"]
    @school_id = params["school_id"]
    @classroom_id = params["classroom_id"]
    @classroom = Classroom.where(id: @classroom_id)
  end

  def create

    @student = Student.new(student_params)
    @user_id = @student.user_id
    @school_id = @student.school_id
    @classroom_id = @student.classroom_id
    @student.save
    if @student.save
      redirect_to "/users/#{@user_id}/schools/#{@school_id}/classrooms/#{@classroom_id}/students/show",
      notice: "Student successfully added"

    else
      render 'show.html.erb'
    end
  end


    private

    def student_params
      params.require(:student).permit(:first_name, :last_name, :grade, :profile_photo, :user_id, :school_id, :classroom_id)
    end

    def authorize_user
      if !user_signed_in?
        raise ActionController::RoutingError.new("Not Found")
      end
    end

end
