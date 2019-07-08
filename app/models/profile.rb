class Profile < ApplicationRecord
  belongs_to :user
  has_many :tweets
  has_one_attached :image

end
