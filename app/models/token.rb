class Token < ApplicationRecord
  validates :token, presence: true

  belongs_to :user
  belongs_to :student


  def self.search_token(n)
    if n
      where('token LIKE ?', "%#{n}%")
    else
      @school = []
    end
  end
end
