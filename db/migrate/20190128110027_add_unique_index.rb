class AddUniqueIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :title, unique:true
    add_index :tests, [:title, :level], unique: true
    add_index :users, :name, unique: true
  end
end
