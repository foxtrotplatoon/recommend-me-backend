class Suggestion < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :proposal, class_name: 'Recc'
end
