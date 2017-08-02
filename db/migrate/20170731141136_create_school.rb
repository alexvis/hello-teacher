class CreateSchool < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false

      t.timestamps
    end
  end
end
