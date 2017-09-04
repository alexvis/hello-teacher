class CommentsController < ApplicationController


  def destroy
    comment = Comment.find(params[:id])
    school_id = comment.classroom.school_id
    classroom_id = comment.classroom.id
    comment.destroy
    if current_user.teacher == false
      redirect_to user_path(current_user)
    elsif comment.student_id
      redirect_to user_school_classroom_student_path(current_user, school_id, classroom_id, comment.student_id)
    else
      redirect_to user_school_classroom_path(current_user, school_id, classroom_id)
    end
  end

  def create


    user_id = current_user.id
    @comment_class = Comment.new(comment_params)
    @classroom = Classroom.where(id: @comment_class.classroom_id)
    school_id = @classroom[0].school_id
    classroom_id = @classroom[0].id
    if @comment_class.subject == "" || @comment_class.comment == ""
      flash[:notice] = "comment can't be empty!"
      redirect_to user_path(current_user)
    else
      if @comment_class.save
        if current_user.teacher == false
          CommentMailer.new_comment(@comment_class).deliver_later
          redirect_to user_path(current_user)
        elsif @comment_class.student_id
          CommentMailer.new_comment(@comment_class).deliver_later
          redirect_to user_school_classroom_student_path(current_user, school_id, classroom_id, @comment_class.student_id)
        elsif
          CommentMailer.new_comment(@comment_class).deliver_later
          redirect_to user_school_classroom_path(current_user, school_id, classroom_id)
        else
          redirect_to "users/current_user.id"
        end
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to user_path(current_user)
    end
  end

  private

  def comment_params
    params.required(:comment).permit(:comment, :subject, :classroom_id, :user_id, :student_id, :ignore)
  end


end
