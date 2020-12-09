class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                  uniqueness: { case_sensitive: false }
  validates :password, allow_blank: true, length: { maximum: 20 }
  validates :profession, allow_blank: true, length: { maximum: 20 }
  validates :first_name, allow_blank: true, length: { maximum: 10 }
  validates :last_name, allow_blank: true, length: { maximum: 10 }
  validates :profile, allow_blank: true, length: { maximum: 200 }
  has_secure_password
  
  has_many :posts
  has_one :skills, class_name:"User"
end
