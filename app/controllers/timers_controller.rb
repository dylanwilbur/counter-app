class TimersController < ApplicationController
  respond_to :html
  respond_to :js
  before_action :check_for_lockup, only: [:index]
  #resolve respond_to error
  
  def new
    @timer = Timer.new
  end
  
  def show
    @timer = Timer.find(params[:id])
    update_story
  end
  
  def index
    @timers = Timer.all
  end
  
  def create
    @timer = Timer.new(timer_params)
    
    if @timer.save
      log_in @timer
      if @timer.email.present?
        TimerMailer.log_in_code(@timer).deliver_now
      end
      flash[:success] = "Timer successfully created.#{" Check email for login link." if @timer.email.present? }"
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
  
  def newStory
    update_story
  end
  
  private
  
    def timer_params
      params.require(:timer).permit(:email)
    end
    
    def update_story
      if cookies[:story_num].nil?
        cookies[:story_num] = rand(Story.count)
      else
        cookies[:story_num] = ((cookies[:story_num].to_i + 1) % (Story.count)).to_s
      end
      # shift range from [0,Story.count-1] to [1, Story.count]
      @story = Story.find(cookies[:story_num].to_i + 1)
    end
  
end
