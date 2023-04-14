class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)
  end
  
  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end


  def edit
    @user = User.find(params[:id])
  end
end
