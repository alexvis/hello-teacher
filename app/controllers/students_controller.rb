class StudentsController < ApplicationController
  before_action :authorize_user, only: [:destroy, :create]

  def index
  end

  def show
    @student = Student.new
    @user_id = params["user_id"]
    @school_id = params["school_id"]
    @classroom_id = params["classroom_id"]
    @classroom = Classroom.where(id: @classroom_id)
    @token = Token.new
  end

  def create

    @student = Student.new(student_params)
    @user_id = @student.user_id
    @school_id = @student.school_id
    @classroom_id = @student.classroom_id
    @student.save
    if @student.save
      redirect_to "/users/#{@user_id}/schools/#{@school_id}/classrooms/#{@classroom_id}/students/#{@student.id}",
      notice: "Student successfully added"

    else
      render 'show.html.erb'
    end
  end

  def edit
    @student = Student.find(params[:id])
    @school_id = params["school_id"]
    @classroom_id = params["classroom_id"]

  end

  def update
    @user_id = current_user.id

    @student = Student.find(params[:id])
    @school_id = @student.school_id
    @classroom_id = @student.classroom_id
    # @classroom = Classroom.where(id: @classroom_id)

    if @student.update(student_params)
      redirect_to "/users/#{@user_id}/schools/#{@school_id}/classrooms/#{@classroom_id}/students/show"
    else
      redirect_to "/users/#{@user_id}/schools/#{@school_id}/classrooms/#{@classroom_id}/students/show"
    end
  end

  def destroy
    @user_id = current_user.id

    @student = Student.find(params[:id])
    @school_id = @student.school_id
    @classroom_id = @student.classroom_id
    student = Student.find(params[:id])
    student.destroy
      redirect_to "/users/#{@user_id}/schools/#{@school_id}/classrooms/#{@classroom_id}/students/show", notice: 'Student was successfully delete!'
  end

    private

    def student_params
      params.require(:student).permit(:first_name, :last_name, :profile_photo, :grade, :user_id, :classroom_id, :school_id)
    end

    def authorize_user
      if !user_signed_in? || !current_user.admin? && !current_user.teacher?
        raise ActionController::RoutingError.new("Not Found")
      end
    end

end
