class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_blog, only: [:create]

  def create
    if params[:comment][:content].present?
      @comment = @blog.comments.create(comment_params)
      @comment.user = current_user
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :blog_id, :user_id)
  end

  def find_blog
    @blog = Blog.find_by id: params[:comment][:blog_id]
    unless @blog
      redirect_to root_url
    end
  end
end