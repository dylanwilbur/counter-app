class TimersController < ApplicationController
  def new
    @timer = Timer.new
  end
  
  def show
    @timer = Timer.find(params[:id])
  end
  
  def index
  end
  
  def create
    @timer = Timer.new
    puts @timer.inspect
    
    if @timer.save
      redirect_to @timer
    else
      render 'new'
    end
  end
end
