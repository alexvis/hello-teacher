class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.string :subject, null: false
      
      t.belongs_to :user
      t.belongs_to :classroom

      t.timestamps
    end
  end
end
