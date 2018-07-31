class Recc < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false

  belongs_to :owner, class_name: :User, foreign_key: "user_id"
  has_many :ratings
  has_many :comments
  has_many :recipients, class_name: :User, foreign_key: "user_id"
end

