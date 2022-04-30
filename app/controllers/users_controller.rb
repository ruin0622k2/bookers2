class UsersController < ApplicationController

  def show
  end

  def index
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to '/users'
  end

  def index
    @user = User
    @books = Book.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
