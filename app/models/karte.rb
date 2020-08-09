class Karte < ApplicationRecord
  has_many   :messages
  belongs_to :gest
  belongs_to :host, optional: true
  belongs_to :cast, optional: true
end