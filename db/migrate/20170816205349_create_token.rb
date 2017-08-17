class CreateToken < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :token, null: false
      t.belongs_to :user
      t.belongs_to :student

      t.timestamps
    end
  end
end
