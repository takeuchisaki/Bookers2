class BookCommentsController < ApplicationController
before_action :ensure_correct_user, only: [:destroy]

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_params)
    comment.book_id = book.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def book_params
    params.require(:book_comment).permit(:comment)
  end
  
  def ensure_correct_user
    @commet = BookComment.find(params[:id])
    unless  @commet.user == current_user
      redirect_to books_path
    end
  end

end
