class Student < ApplicationRecord
  mount_uploader :profile_photo, ProfilePhotoUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade, presence: true

  belongs_to :user
  belongs_to :classroom
  belongs_to :school
  has_many :tokens, dependent: :destroy
  has_many :users, through: :tokens


  def full_name
    "#{first_name} #{last_name}"
  end
end
