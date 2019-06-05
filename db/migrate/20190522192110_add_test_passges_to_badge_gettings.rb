class AddTestPassgesToBadgeGettings < ActiveRecord::Migration[5.2]
  def change
    add_reference :badge_gettings, :test_passage, foreign_key: true
  end
end
