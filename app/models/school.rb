class School < ApplicationRecord

  validates :name, presence: true
  validates :state, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, numericality: true, length: { is: 5}
  validates :name, uniqueness: {
    scope:[:address, :city, :state],
    message: "alredy exists for this address"
  }

  def admin?
    role == "admin"
  end

  def teacher?
    teacher == true
  end
end
