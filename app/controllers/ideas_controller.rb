class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @categories = Category.all

    @idea = Idea.new
  end

  def create
    @idea = Idea.create(idea_params)
    if @idea.save
      flash[:success] = "You've saved your brilliant idea"
      redirect_to idea_path(@idea)
    else
      flash[:success] = "Please fill out the form completely to submit your idea"
      redirect :new
    end
  end

  def show
    
    @idea = Idea.find(params[:id])

  end



  private

  def idea_params
    params.require(:idea).permit(:name, :content, :category_id)
  end
end
