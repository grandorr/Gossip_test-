class Gossip < ApplicationRecord
  validates :title,
    presence: true,
    length: { minimum: 3,maximum: 15 }
  validates :content,
    presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
end
