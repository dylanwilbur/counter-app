class SessionsController < ApplicationController
  def new
  end
  
  def create
    timer = Timer.find_by(id: params[:id])
    if timer
      log_in timer
      remember timer
      redirect_to timer
    else
      flash.now[:danger] = "Session create machine broke"
      redirect_to root_url
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
