class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @user = User.find(current_user.id)
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @bookn = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.update(book_params)
    redirect_to book_path(@book)
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
