class Blog < ApplicationRecord
  scope :sort_by_ASC, ->{order created_at: :asc}
  scope :sort_by_DESC, ->{order created_at: :desc}

  mount_uploader :intro_image, ImageUploader
  mount_uploader :author_image, ImageUploader
  IMAGES_PATH = File.join Rails.root, "public",
    "uploads/blog_images", "image"

  BLOG_ATTRS = [:id, :title, :category_id, :public_time, :public_status,
    :suggest_status, :intro_image,
    :content, :author_name, :author_position, :author_age, :author_image]

  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  validates :title, presence: true
  validates_length_of :title, maximum: 255
  validates :public_time, presence: true
  validates :intro_image, presence: true
  validates :author_name, presence: true
  validates_length_of :author_name, maximum: 32
  validates :author_position, presence: true
  validates_length_of :author_position, maximum: 32
  validates :author_age, presence: true
  validates :content, presence: true
  validates_length_of :author_age, maximum: 32
  validate :image_size_validation

  enum public_status: {draft: Settings.blog.status.draft,
    published: Settings.blog.status.published}

  enum suggest_status: {unavailable: Settings.blog.suggest.unavailable,
    available: Settings.blog.suggest.available}

  def stop_public_blog
    update_attribute 'public_status', Blog.public_statuses[:draft]
  end

  private
  def image_size_validation
    if intro_image.size > 2.megabytes
      errors.add(:intro_image, t("errors.size_image"))
    end
    if author_image.size > 2.megabytes
      errors.add(:author_image, t("errors.size_image"))
    end
  end
end
