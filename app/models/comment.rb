class Comment < ApplicationRecord
  validates :comments, null: false
  validates :subject, null: false
  
  belongs_to :user
  belongs_to :classroom
end
