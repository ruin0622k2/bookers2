class UsersController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def index
    @user = User.name
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit(:name,:body)
  end

end
