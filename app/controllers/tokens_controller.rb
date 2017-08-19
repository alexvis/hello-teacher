class TokensController < ApplicationController

  before_action :authorize_user, only: [:index]


  def create
    @user_id = current_user.id
    if current_user.teacher == false
      @token = Token.new(token_params)
      @token.save
      redirect_to user_path(current_user)
    if !@token.save
      flash[:notice] = "not valid token or id "
    end

    else
      @token = Token.new(token_params)

      @school_id = @token.user.schools[0].id
      @classroom_id = @token.user.schools[0].classrooms[0].id

      if @token.token == ''
        redirect_to "/users/#{@user_id}/schools/#{@school_id}/classrooms/#{@classroom_id}/students/show", notice: 'Student token can\'t be empty!'
      else
        @token.save
          redirect_to "/users/#{@user_id}/schools/#{@school_id}/classrooms/#{@classroom_id}/students/show", notice: 'Student token was successfully added!'
      end
    end

  end


  def destroy
    @user_id = current_user.id

    token = Token.find(params[:id])
    token.destroy
    if current_user.teacher == true
      @school_id = token.student.school.id
      @classroom_id = token.student.classroom.id
      redirect_to "/users/#{@user_id}/schools/#{@school_id}/classrooms/#{@classroom_id}/students/show", notice: 'Student token was successfully delete!'
    else
      redirect_to user_path(current_user)
    end
  end

  private
  def token_params
    params.require(:token).permit(:token, :user_id, :student_id)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin? && !current_user.teacher?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
