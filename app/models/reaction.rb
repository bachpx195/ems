class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  enum rate_type: {like: Settings.reaction.rate.like,
    gratitude: Settings.reaction.rate.gratitude,
    bored: Settings.reaction.rate.bored,
    dissapointed: Settings.reaction.rate.dissapointed}
end
