class Message < ApplicationRecord

  belongs_to :host
  belongs_to :casts
  belongs_to :gests
  belongs_to :messages
  belongs_to :kartes

  validates :content, presence: true, unless: :image?
  # mount_uploader :image, ImageUploader
end
