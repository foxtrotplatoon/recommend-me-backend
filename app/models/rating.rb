class Rating < ApplicationRecord
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  belongs_to :user
  has_one :recc
end
