class Api::V1::BooksController < ApplicationController
  before_action :authenticate_api
  before_action :load_book, :only => [:show, :update, :destroy]

  # GET '/api/books'
  def index
    @books = Book.all
    render :json => @books
  end

  # GET '/api/books/:id'
  def show
    render :json => @book
  end

  # POST '/api/books'
  def create
    @book = current_user.books.build book_params
    if @book.save
      render :json => @book, :status => 201
    else
      respond_with_invalid_book_errors
    end
  end

  # PUT/PATCH '/api/books/:id'
  def update
    if @book.update(book_params)
      render json: @book, status: 200
    else
      respond_with_invalid_book_errors
    end
  end

  # DELETE '/api/books'
  def destroy
    @book.destroy
    head 204
  end

  protected
  # Renders validation errors of a book with status 422
  def respond_with_invalid_book_errors
    render json: { errors: @book.errors }, status: 422
  end

  # Loads the book with the given id to the @book instance variable
  def load_book
    @book = Book.find(params[:id]) if params[:id].present?
  end

  # Defined valid params
  def book_params
    params.require(:book).permit(:name, :author_name, :user_id, :publish_year)
  end

  def authenticate_api
    render json: { errors: "Please login first to access this data." }, status: 301 unless current_user
  end

end
