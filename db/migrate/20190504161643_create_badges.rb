class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :category
      t.integer :element
      t.string :condition

      t.timestamps
    end
  end
end
