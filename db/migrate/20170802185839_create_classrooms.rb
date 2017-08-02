class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :subject, null: false
      t.string :grade, null: false
      t.integer :class_number, null: false
      t.belongs_to :users
      t.belongs_to :school

      t.timestamps
    end
  end
end
