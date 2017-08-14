class School < ApplicationRecord

  validates :name, presence: true
  validates :state, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true, length: { is: 5}

  def teacher?
    teacher == true
  end


  def self.search_name(school)
    if school
      where('name LIKE ?', "%#{school}%")
    else
      @school = []
    end
  end

  def self.search_address(school)
    if school
      where('address LIKE ?', "%#{school}%")
    else
      @school = []
    end
  end


  belongs_to :user
  has_many :classrooms
  has_many :students
end
