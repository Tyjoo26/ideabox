class UsersController < ApplicationController
  before_action :check_logged_in, except: [:new, :create]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def check_logged_in
    redirect_to login_path unless session[:user_id]
  end

end
