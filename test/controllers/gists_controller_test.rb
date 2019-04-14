require 'test_helper'

class GistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gists_index_url
    assert_response :success
  end

end
