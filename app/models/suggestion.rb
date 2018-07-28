class Suggestion < ApplicationRecord
  belongs_to :user

  has_many :target_users
  has_one :rec
end
