class Recc < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false

  has_many :ratings
  has_many :comments
end
