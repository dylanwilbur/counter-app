class StaticPagesController < ApplicationController
  
  def home
    if !session[:timer_id].nil?
      return redirect_to timer_path(session[:timer_id])
    end
  end

  def about
  end
  
  def for_teachers
  end
  
  def inspiration
  end
  
end
