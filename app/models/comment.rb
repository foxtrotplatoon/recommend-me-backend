class Comment < ApplicationRecord
  validates :comment_text, presence: true, allow_blank: false

  belongs_to :user
  has_one :recc
end
