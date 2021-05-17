class BooksController < ApplicationController
  before_action :load_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  def index
    @books = current_user.books.order("created_at desc")
    					.paginate(page: params[:page], per_page: 12)
  end

  # Get /books/:id
  def show
  end

  # GET /books/new
  def new
    # entry_type = params[:type] if %w(lost found).include?(params[:type])
    @book = current_user.books.build
  end

  # POST /books
  def create
    @book = current_user.books.build(books_params)
    if @book.save
    	flash[:notice] = "Book was created successfully."
      redirect_to books_path
    else
      render :new
    end
  end

  # GET /books/:id/edit
  def edit
  	@book = current_user.books.find(params[:id]) if params[:id]
  end

  # PUT/PATCH /books/:id
  def update
    if @book.update(books_params)
    	flash[:notice] = "Book was updated successfully."
      redirect_to books_path
    else
      render :new
    end
  end

  # DELETE /books/:id
  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
  # Retrieves the cat entry with the given id
  def load_book
    @book = Book.find(params[:id])
  end

  def books_params
  	params.require(:book).permit(:name, :author_name, :user_id, :publish_year)
  end
end
