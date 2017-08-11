class School < ApplicationRecord

  validates :name, presence: true
  validates :state, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true, length: { is: 5}

  def teacher?
    teacher == true
  end

  belongs_to :user
  has_many :classrooms
  has_many :students
end
