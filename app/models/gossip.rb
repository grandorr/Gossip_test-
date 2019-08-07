class Gossip < ApplicationRecord
  belongs_to :user
  validates :title,
    presence: true,
    length: { minimum: 2,maximum: 15 }
  validates :content,
    presence: true
end
