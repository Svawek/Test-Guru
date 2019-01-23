class RemoveColumnFromUsersTest < ActiveRecord::Migration[5.2]
  def change
    remove_column :users_tests, :id
  end
end
