class Recc < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false

  has_many :ratings
  has_many :comments

  belongs_to :owner, class_name: :User, foreign_key: "user_id"

  has_many :suggestions, foreign_key: 'proposal_id'
  has_many :recipients, through: :suggestions
end
