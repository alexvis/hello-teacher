class School < ApplicationRecord

  validates :name, presence: true
  validates :state, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true, length: { is: 5}

  def teacher?
    teacher == true
  end

  def self.search_name(n)
    if n
      where('name LIKE ?', "%#{n}%")
    else
      @school = []
    end
  end

  def self.search_address(a)
    if a
      where('address LIKE ?', "%#{a}%")
    else
      @school = []
    end
  end

  def self.search_zip_code(z)
    if z
      where('zip_code LIKE ?', "%#{z}%")
    else
      @school = []
    end
  end


  belongs_to :user
  has_many :classrooms
  has_many :students
end
