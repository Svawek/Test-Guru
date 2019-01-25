class RemoveAndAddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :passed_tests, :string
    add_column :users, :admin, :boolean, default: false
  end
end
