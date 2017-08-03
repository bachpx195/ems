class BlogsController < ApplicationController
  def index
    @blogs = Blog.includes(:category).page(params[:page]).per(20)
  end
end
