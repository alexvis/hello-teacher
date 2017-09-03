class AddBooleanReadToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :ignore, :boolean, default: false
  end
end
