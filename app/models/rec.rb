class Rec < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :ratings #user ratings of the rec
  has_many :suggestions #user to user suggestions for the rec
  has_many :comments #user comments on rec page
end
