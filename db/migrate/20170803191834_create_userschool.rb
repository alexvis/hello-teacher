class CreateUserschool < ActiveRecord::Migration[5.1]
  def change
    create_table :userschools do |t|
      t.belongs_to :school
      t.belongs_to :user
    end
  end
end
