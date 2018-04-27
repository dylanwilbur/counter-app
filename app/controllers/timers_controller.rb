class TimersController < ApplicationController
  respond_to :js
  respond_to :html
  #resolve respond_to error
  
  def new
    @timer = Timer.new
  end
  
  def show
    @timer = Timer.find(params[:id])
  end
  
  def index
    @timers = Timer.all
  end
  
  def create
    @timer = Timer.new
    puts @timer.inspect
    
    if @timer.save
      log_in @timer
      flash[:success] = "Timer successfully created"
      redirect_to @timer
    else
      render 'new'
    end
  end
  
  def destroy
    Timer.find(params[:id]).destroy
    flash[:success] = "Timer deleted"
    redirect_to timers_url
  end
end
