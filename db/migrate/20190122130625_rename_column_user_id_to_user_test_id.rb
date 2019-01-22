class RenameColumnUserIdToUserTestId < ActiveRecord::Migration[5.2]
  def change
    rename_column :opened_tests, :user_id, :user_test_id
  end
end
