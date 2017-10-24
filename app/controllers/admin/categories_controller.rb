class Admin::CategoriesController < ApplicationController

  def index

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You created a new #{@category.title} category!"
      redirect_to admin_categories_path
    else
      flash[:success] = "You must create a category with a title!"
      render :new
    end
  end



  def destroy
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def current_admin
    render_404 unless current_user.admin?
  end


end
