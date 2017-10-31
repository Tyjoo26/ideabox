class Admin::ImagesController < Admin::BaseController
  before_action :require_admin

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "The image was added!"
      redirect_to admin_images_post
    else
      render 'new'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to user_images_path
  end

  private

  def image_params
    params.require(:image).permit(:image, :name)
  end

end
