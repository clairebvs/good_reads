class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @highest_rating_book = @book.highest_rating.rating
    @high_rate_name = @book.highest_rating.user.name
    @high_rate_comment = @book.highest_rating.comment

    @lowest_rating = @book.lowest_rating.rating
    @lowest_rating_name = @book.lowest_rating.user.name
    @lowest_rating_comment = @book.lowest_rating.comment
  end
end
