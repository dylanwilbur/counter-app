require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get new_timer_path
    
    assert_no_difference 'Timer.count' do
      post timers_path, params: { timer: { email: "user@invalid" } }
    end
    
    assert_template 'timers/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
end