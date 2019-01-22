class CreateOpenedTests < ActiveRecord::Migration[5.2]
  def change
    create_table :opened_tests do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.boolean :test_passed
      t.boolean :test_opened

      t.timestamps
    end
  end
end
