namespace :db do
  desc "remake database data"

  task update_reaction_blog: :environment do
    Blog.published.each do |x|
      a = Reaction.where(blog_id: x.id).select(:rate_type).group(:rate_type).count
      a['biglike'] = 0 unless a['biglike']
      a['like'] = 0 unless a['like']
      a['dislike'] = 0 unless a['dislike']
      a['bigdislike'] = 0 unless a['bigdislike']
      Blog.find(x.id).update(biglikes_count: a['biglike'],
                             likes_count: a['like'],
                             dislikes_count: a['dislike'],
                             bigdislikes_count: a['bigdislike'])
    end
  end
end
