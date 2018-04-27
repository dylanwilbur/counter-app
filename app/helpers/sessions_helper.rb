module SessionsHelper
  
  def log_in(timer)
    session[:timer_id] = timer.id
  end
  
  def current_timer
    @current_timer ||= Timer.find_by(id: session[:timer_id])
  end
  
  def logged_in?
    !current_timer.nil?
  end
end
