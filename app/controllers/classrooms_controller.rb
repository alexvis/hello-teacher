class ClassroomsController < ApplicationController
 before_action :authorize_user, only: [:destroy, :create, :update, :edit]


  def index
    @classroom = Classroom.new
    @school_id = params["school_id"]
    @school = School.where(id: @school_id)
  end

  def show
    @classroom = Classroom.find(params[:id])
    @school_id = params["school_id"]
    @comment = Comment.new
  end

  def create
    @classroom = Classroom.new(classroom_params)
    @school = @classroom.school_id
    @user_id = current_user.id
    if @classroom.save
      redirect_to "/users/#{@user_id}/schools/#{@school}/classrooms/show"
    else
      render 'show.html.erb'
      flash[:notice] = "not good"
    end
  end

  def edit
    @classroom = Classroom.find(params[:id])
    @school_id = params["school_id"]

  end

  def update
    @user_id = current_user.id
    @classroom = Classroom.find(params[:id])
    @school = @classroom.school_id

    if @classroom.update(classroom_params)
      redirect_to "/users/#{@user_id}/schools/#{@school}/classrooms/show"
    else
      render 'show.html.erb'
    end
  end

  def new
    @classroom = Classroom.new
    @school = params["school_id"]
    @user = params["user_id"]
    @schools = School.all
    @classrooms = params["classrooms"]

  end


  def destroy
    @user_id = current_user.id

    @classroom = Classroom.find(params[:id])
    @school = @classroom.school_id

    @classroom.destroy
    redirect_to "/users/#{@user_id}/schools/#{@school}/classrooms/show", notice: 'User was successfully destroyed!'
  end

  private

  def classroom_params
    params.require(:classroom).permit(:subject, :grade, :class_number, :user_id, :school_id)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin? && !current_user.teacher?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

end
