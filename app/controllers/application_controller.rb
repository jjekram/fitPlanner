class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include RoutinesHelper
 

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    log_out
    super
  end
end
