class Cast < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates  :name, presence: true, uniqueness: true
  has_many   :messages
  has_many   :kartes
end
