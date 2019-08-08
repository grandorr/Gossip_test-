class User < ApplicationRecord
    has_secure_password
    validates :password,
      presence: true,
      length: { minimum: 1}


      has_many :gossips
      belongs_to :city ,optional: true
      has_many :comments
      has_many :likes
end
