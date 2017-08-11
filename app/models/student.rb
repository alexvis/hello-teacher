class Student < ApplicationRecord
  mount_uploader :profile_photo, ProfilePhotoUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade, presence: true

  belongs_to :user
  belongs_to :classroom
  belongs_to :school


  def full_name
    "#{first_name} #{last_name}"
  end
end
