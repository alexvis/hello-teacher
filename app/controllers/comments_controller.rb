class CommentsController < ApplicationController


  def destroy
    comment = Comment.find(params[:id])
    school_id = comment.classroom.school_id
    classroom_id = comment.classroom.id
    comment.destroy
    redirect_to user_school_classroom_path(current_user, school_id, classroom_id)
  end

  def create
    user_id = current_user.id
    @comment_class = Comment.new(comment_params)
    @classroom = Classroom.where(id: @comment_class.classroom_id)
    school_id = @classroom[0].school_id
    classroom_id = @classroom[0].id
    if @comment_class.save
      CommentMailer.new_comment(@comment_class).deliver_later
      redirect_to user_school_classroom_path(current_user, school_id, classroom_id)
    else
      redirect_to "users/current_user.id"
    end
  end

  private

  def comment_params
    params.required(:comment).permit(:comment, :subject, :classroom_id, :user_id)
  end

end
