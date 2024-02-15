class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

  after_create :publish_to_facebook

  private

  def publish_to_facebook
    user = Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])
    message = "Новий пост на блозі: #{title}\n#{body}"
    options = { 'link' => post_url(self) }

    user.put_wall_post(message, options)
  end
end
