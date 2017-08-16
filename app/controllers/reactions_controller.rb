class ReactionsController < ApplicationController
  def create
    reaction = Reaction.where(user_id: params[:user_id],
                              blog_id: params[:blog_id]).first
    if reaction
      reaction.update(rate_type: params[:user_action])
    else
      Reaction.create(user_id: params[:user_id], blog_id: params[:blog_id],
                      rate_type: params[:user_action])
    end
    UpdateactionJob.set(wait: 3.seconds).perform_later(params[:blog_id])
    respond_to do |format|
      @count_action = Reaction.where(blog_id: params[:blog_id])
                          .select(:rate_type)
                          .group(:rate_type).count
      format.js
    end
  end
end
