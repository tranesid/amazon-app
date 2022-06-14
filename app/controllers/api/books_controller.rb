class Api::BooksController < ApplicationController
  #this is differnet
  before_action :set_author, except [:all_books]
  before_action :set_book, only: [:show, :update :destroy]

  def all_books
    render json: Book.all
  end

  def find_book
    render json: Book.find(params[:book_id])

  def index
      #this is differnet not book.all
    render json: @author.books
  end

  def show
    render json: @book
  end

  def create 
      #this is differnet @auth.books.new not book.new
    @book = @author.books.new(book_params)
    if(@book.save)
      render json: @book
    else
      render json: @book.errors.full_message, status 422
    end 
  end

  def update 
    if(@book.update(book_params))
      render json: @book
    else 
      render json: @book.errors.full_message, status 422
    end 

  private 

  def set_author
    @author = Author.find(parmas[:author_id])
  end

  def set_book
      #this is differnet we use @auth.books to find book..
      # we don't do Book.find(params[:id])
    @book = @author.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :genre)
  end
end 

