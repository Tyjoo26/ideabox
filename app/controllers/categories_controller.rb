class CategoriesController < ApplicationController
  before_action :current_user

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

end
