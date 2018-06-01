class TimerMailersController < ApplicationController
  
  def edit
    timer = Timer.find(params[:id])
    if timer && !logged_in?
      log_in timer
      flash[:success] = "Successfully activated counter."
      redirect_to timer
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
    
  end
  
end
