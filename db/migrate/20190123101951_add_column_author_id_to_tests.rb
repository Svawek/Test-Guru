class AddColumnAuthorIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :author_id, :integer, index: true
    add_index :tests, :author_id
  end
end
