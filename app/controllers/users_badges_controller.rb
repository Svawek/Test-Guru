class UsersBadgesController < ApplicationController
  def show
    @badges = Badge.all
    @badges_received = UsersBadge.where(user_id: current_user.id)
  end
end
