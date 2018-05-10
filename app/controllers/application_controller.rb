require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html
  respond_to :js

  protect_from_forgery with: :exception
  include SessionsHelper
end
