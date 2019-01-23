class RenameOpenedTestsToUserTests < ActiveRecord::Migration[5.2]
  def change
    rename_table :opened_tests, :users_tests
  end
end
