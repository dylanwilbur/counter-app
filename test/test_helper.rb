ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  def is_logged_in?
    !session[:timer_id].nil?
  end
  
  def log_in_as(timer)
    session[:timer_id] = timer.id
  end

  # Add more helper methods to be used by all tests here...
end
