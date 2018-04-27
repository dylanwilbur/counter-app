class StaticPagesController < ApplicationController
  
  def home
    timer = Timer.find_by(id: params[:id])
    if timer
      log_in timer
      redirect_to timer
    else
      flash[:danger] = "Session create machine broke"
    end
  end

  def info
  end
end
