class StaticPagesController < ApplicationController
  
  def home
    if !session[:timer_id].nil?
      return redirect_to timer_path(session[:timer_id])
    end
  end

  def info
    respond_to do |format|
      format.json {
        render :json => [1,2,3,4,5]
      }
    end
  end
end
