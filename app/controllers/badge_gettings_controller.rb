class BadgeGettingsController < ApplicationController
  def show
    @badges = Badge.all
    @badges_received = BadgeGetting.where(user_id: current_user.id)
  end
end
