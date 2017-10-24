class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.new
  end

  def create
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.create(idea_params)
    if @idea.save
      flash[:success] = "You've saved your brilliant idea"
      redirect_to category_idea_path(@category, @idea)
    else
      flash[:success] = "Please fill out the form completely to submit your idea"
      redirect :new
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @idea = Idea.find(params[:id])
    
  end



  private

  def idea_params
    params.require(:idea).permit(:name, :content, :author)
  end
end
