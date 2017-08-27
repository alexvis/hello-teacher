class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def create
    user_id = current_user.id
    @comment_class = Comment.new(comment_params)

    if @comment_class.save
      CommentMailer.new_comment(@comment_class).deliver_later
      redirect_to user_path(current_user)
    else
      redirect_to "users/current_user.id"
    end
  end

  private

  def comment_params
    params.required(:comment).permit(:comment, :classroom_id, :user_id)
  end

end
