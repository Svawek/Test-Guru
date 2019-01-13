class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :body
      t.string :answer
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
