class Classroom < ApplicationRecord

  validates :subject, presence: true
  validates :grade, presence: true
  validates :class_number, presence: true

  belongs_to :user
  belongs_to :school
  has_many :students, dependent: :destroy
  has_many :comments
  has_many :users, through: :comments

end
