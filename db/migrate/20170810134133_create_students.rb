class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :profile_photo
      t.string :grade, null: false
      t.belongs_to :user
      t.belongs_to :classroom
      t.belongs_to :school

      t.timestamps
    end
  end
end
