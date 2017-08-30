class ReactionsController < ApplicationController
  before_action :find_blog, only: [:create, :destroy]

  def create
    if params[:user_id].blank?
      cookies[:check_action] = params[:user_action]
      @check_action = cookies[:check_action]
    else
      reaction = Reaction.where(user_id: params[:user_id],
                                blog_id: params[:blog_id]).first
      if reaction
        @blog.unrate_like reaction.rate_type
        reaction.update(rate_type: params[:user_action])
      else
        reaction = Reaction.create!(user_id: params[:user_id], blog_id: params[:blog_id], rate_type: params[:user_action])
      end
      @check_action = reaction.rate_type
    end
    respond_to do |format|
      @blog.rate_like params[:user_action]
      format.js
    end
  end

  def destroy
    reaction = Reaction.where(user_id: params[:user_id],
                              blog_id: params[:blog_id]).first
    reaction.destroy!
    @check_action = ""
    respond_to do |format|
      @blog.unrate_like params[:user_action]
      format.js
    end
  end

  private
  def find_blog
    @blog = Blog.find_by id: params[:blog_id]
    unless @blog
      redirect_to root_url
    end
  end
end
