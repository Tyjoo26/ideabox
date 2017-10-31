class Admin::CategoriesController  < Admin::BaseController
  before_action :require_admin

  def index
    @categories = Category.all
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
      flash[:success] = "Category already exists, try again!"
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



end
