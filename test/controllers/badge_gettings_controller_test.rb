require 'test_helper'

class BadgeGettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get badge_gettings_show_url
    assert_response :success
  end

end
