class RenameUsersToUserTests < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :user_tests
  end
end
