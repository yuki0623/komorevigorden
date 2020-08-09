class Message < ApplicationRecord

  belongs_to :host, optional: true
  belongs_to :cast, optional: true
  belongs_to :gest, optional: true
  belongs_to :karte

  validates :content, presence: true, unless: :image?
  # mount_uploader :image, ImageUploader
end
