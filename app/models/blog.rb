class Blog < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  enum public_status: {draft: Settings.blog.status.draft,
    published: Settings.blog.status.published}

  enum suggest_status: {none: Settings.blog.suggest.none,
    available: Settings.blog.suggest.available}
end
