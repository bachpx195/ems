class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_blog, only: [:show]

  def index
    if params[:category].nil?
      if params[:get_suggest_action].eql? "suggest"
        @blogs = Blog.published.available.includes(:category).sort_by_public_time.page(params[:page]).per(10)
      else
        @blogs = Blog.published.includes(:category).sort_by_public_time.page(params[:page]).per(10)
      end
    else
      @blogs = Blog.published.where(category_id: params[:category].to_i).sort_by_public_time.includes(:category).page(params[:page]).per(10)
    end
    @category = Category.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @blog_comments = @blog.comments.includes(:user).order('created_at ASC')
    if current_user
      @action = Reaction.where(user_id: current_user.id,
                               blog_id: @blog.id).first

      @check_action = @action.rate_type if @action
    end

    @count_action = Reaction.where(blog_id: @blog.id)
                        .select(:rate_type)
                        .group(:rate_type).count
  end

  private
  def find_blog
    @blog = Blog.find_by id: params[:id]
    unless @blog
      redirect_to root_url
    end
  end
end
