class Skill < ApplicationRecord
  has_one :user
  
  validates :title, length: { maximum: 10 }
  validates :description, length: { maximum: 150 }
end
