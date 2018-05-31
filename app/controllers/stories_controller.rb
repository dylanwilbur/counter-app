class StoriesController < ApplicationController
  def new
    @story = Story.new
  end
  
  def create
    @story = Story.new(story_params)
    
    if @story.save
      flash[:success] = "Story created!"
      redirect_to @story
    else
      flash.now[:danger] = "Story not created"
      render 'stories/new'
    end
  end
  
  def show
    @story = Story.find(params[:id])
  end
  
  def index
    @stories = Story.all
  end
  
  def edit
    @story = Story.find(params[:id])
  end
  
  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(story_params)
      flash[:success] = "Profile updated"
      redirect_to @story
    else
      render 'edit'
    end
  end
  
  private

    def story_params
      params.require(:story).permit(:name, :img, :content)
    end
  
end