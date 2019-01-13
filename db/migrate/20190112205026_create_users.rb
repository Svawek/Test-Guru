class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.references :test, foreign_key: true
      t.string :passed_tests

      t.timestamps
    end
  end
end
