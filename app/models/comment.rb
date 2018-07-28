class Comment < ApplicationRecord
  validates :comment_text, presence: true

  belongs_to :user
  has_one :rec
end
