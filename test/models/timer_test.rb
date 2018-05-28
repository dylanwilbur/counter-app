require 'test_helper'

class TimerTest < ActiveSupport::TestCase
  def setup
    @start = Time.now
    @timer = Timer.new(email: "user@example.com")
    @timer.save
  end
  
  test "should be valid" do
    assert @timer.valid?
  end
  
  test "should get correct time" do
    sleep(2)
    correct_time = (Time.now - @start).floor
    assert_equal(2, correct_time)
    assert_equal(correct_time, @timer.elapsed_time)
  end
  
  test "should allow nil email" do
    @timer.email = nil
    assert @timer.save
    assert @timer.valid?
  end
  
  test "should allow nothing email" do
    @timer.email = ""
    assert @timer.valid?
    assert @timer.save
  end
  
  test "should not allow blank email" do
    @timer.email = "         "
    assert_not @timer.valid?
  end
  
  test "email should not be too long" do
    @timer.email = "a" * 244 + "@example.com"
    assert_not @timer.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @timer.email = valid_address
      assert @timer.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @timer.email = invalid_address
      assert_not @timer.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @timer.email = mixed_case_email
    @timer.save
    assert_equal mixed_case_email.downcase, @timer.reload.email
  end
  
end
