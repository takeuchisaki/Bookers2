class BooksController < ApplicationController
  def index
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
  end

  def edit
  end
end
