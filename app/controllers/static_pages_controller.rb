class StaticPagesController < ApplicationController
  
  def home
    if !session[:timer_id].nil?
      redirect_to timer_path(session[:timer_id])
    end
  end

  def info
  end
end
