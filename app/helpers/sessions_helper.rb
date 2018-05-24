module SessionsHelper
  
  def log_in(timer)
    session[:timer_id] = timer.id
  end
  
  def current_timer
    if session[:timer_id]
      @current_timer ||= Timer.find_by(id: session[:timer_id])
    elsif cookies.signed[:timer_id]
      timer = Timer.find_by(id: cookies.signed[:timer_id])
      if timer
        log_in(timer)
        @current_timer = timer
      end
    end
  end
  
  def logged_in?
    !current_timer.nil?
  end
  
  def remember(timer)
    timer.remember
    cookies.permanent.signed[:timer_id] = timer.id
    cookies.permanent[:remember_token] = timer.remember_token
  end
  
  def forget(timer)
    timer.forget
    cookies.delete(:timer_id)
    cookies.delete(:remember_token)
    cookies.delete(:lockup)
  end
  
  def log_out
    forget(current_timer)
    session.delete(:timer_id)
    @current_timer = nil
  end
end
