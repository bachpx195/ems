class BlogsController < ApplicationController
  def index
    @blogs = Blog.includes(:category).page(params[:page]).per(20)
    @category = Category.all
  end
end
