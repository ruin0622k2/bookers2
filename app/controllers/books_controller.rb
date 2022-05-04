class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @user = User.all
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to book_path(@book.id)
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path, notice: 'book was successfully deleted!'
    else
      @books = Book.find(params[:id])
      render :show
    end
  end


private

  def book_params
    params.require(:book).permit(:title,:body,:User_id)
  end

end