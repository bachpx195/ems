class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:comment][:blog_id])
    if params[:comment][:content].present?
      @comment = @blog.comments.create(comment_params)
      @comment.user = current_user
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :blog_id, :user_id)
  end
end