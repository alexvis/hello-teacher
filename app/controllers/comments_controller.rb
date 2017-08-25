class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def create
    user_id = current_user.id
    @comment_class = Comment.new(comment_params)
    @comment_class.save
    redirect_to user_path(current_user)
  end

  private

  def comment_params
    params.required(:comment).permit(:comment, :classroom_id, :user_id)
  end

end
