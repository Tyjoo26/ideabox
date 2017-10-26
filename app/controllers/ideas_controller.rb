class IdeasController < ApplicationController
  before_action :current_user, only: [:new, :create, :update, :destroy]

  def index
    @ideas = Idea.all
  end

  def new
    @categories = Category.all
    @user = current_user
    @idea = @user.ideas.new
  end

  def create
    @user = current_user
    @idea = @user.ideas.create(idea_params)
    if @idea.save
      flash[:success] = "You've saved your brilliant idea"
      redirect_to user_idea_path(@user, @idea)
    else
      flash[:success] = "Please fill out the form completely to submit your idea"
      redirect :new
    end
  end

  def show
    @user = current_user
    @idea = @user.ideas.find(params[:id])
  end



  private

  def idea_params
    params.require(:idea).permit(:name, :content, :category_id)
  end
end
