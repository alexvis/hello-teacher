class Token < ApplicationRecord
  validates_uniqueness_of :token, scope: :student_id

  belongs_to :user
  belongs_to :student
end
