class User < ApplicationRecord
  mount_uploader :profile_photo, ProfilePhotoUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :teacher, inclusion: { in: [true, false]}
  validates :parent, inclusion: { in: [true, false]}

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == "admid"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  has_many :tokens, dependent: :destroy
  has_many :schools, dependent: :destroy
  has_many :classrooms, dependent: :destroy

  has_many :students, through: :tokens
end
