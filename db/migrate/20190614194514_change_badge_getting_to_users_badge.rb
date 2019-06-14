class ChangeBadgeGettingToUsersBadge < ActiveRecord::Migration[5.2]
  def change
    rename_table :badge_gettings, :users_badges
  end
end
