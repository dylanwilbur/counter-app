require 'test_helper'

class TimersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stopwatch_path
    assert_response :success
  end

end
