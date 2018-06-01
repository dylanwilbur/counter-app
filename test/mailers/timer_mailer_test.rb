require 'test_helper'

class TimerMailerTest < ActionMailer::TestCase
  test "log_in_code" do
    timer = timers(:one)
    mail = TimerMailer.log_in_code(timer)
    assert_equal "Account code", mail.subject
    assert_equal [timer.email], mail.to
    assert_equal ["no-reply@example.com"], mail.from
  end
end
