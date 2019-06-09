class AddTimerToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer, :integer, default: 0
  end
end
