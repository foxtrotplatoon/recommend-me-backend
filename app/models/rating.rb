class Rating < ApplicationRecord
  validates :score, presence: true

  belongs_to :user
  has_one :rec
end
