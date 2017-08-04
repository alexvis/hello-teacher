class AddForingKeyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :schools, :user, foreing_key: true
  end
end
