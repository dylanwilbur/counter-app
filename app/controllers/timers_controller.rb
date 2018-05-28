class TimersController < ApplicationController
  respond_to :html
  respond_to :js
  before_action :check_for_lockup, only: [:index]
  #resolve respond_to error
  TOTAL_STORY_COUNT = 3
  
  def new
    @timer = Timer.new
  end
  
  def show
    @timer = Timer.find(params[:id])
    if cookies[:story_num].nil?
      cookies[:story_num] = rand(TOTAL_STORY_COUNT)
    else
      cookies[:story_num] = ((cookies[:story_num].to_i + 1) % TOTAL_STORY_COUNT).to_s
    end
  end
  
  def index
    @timers = Timer.all
  end
  
  def create
    @timer = Timer.new(timer_params)
    
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
  
  private
  
    def timer_params
      params.require(:timer).permit(:email)
    end
  
  
end
