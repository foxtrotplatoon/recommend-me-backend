class Recc < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :ratings
  has_many :comments
end
