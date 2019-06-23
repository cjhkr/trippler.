require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  test "should get toggle" do
    get :toggle
    assert_response :success
  end

end
