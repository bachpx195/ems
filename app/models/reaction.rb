class Reaction < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :blog

  enum rate_type: %i{not_choose biglike like dislike bigdislike}

  def self.update_action_count(blog_id)
    a = Reaction.where(blog_id: blog_id).select(:rate_type).group(:rate_type).count
    a['biglike'] = 0 unless a['biglike']
    a['like'] = 0 unless a['like']
    a['dislike'] = 0 unless a['dislike']
    a['bigdislike'] = 0 unless a['bigdislike']
    Blog.find(blog_id).update(biglikes_count: a['biglike'],
                              likes_count: a['like'],
                              dislikes_count: a['dislike'],
                              bigdislikes_count: a['bigdislike'])
  end
end
