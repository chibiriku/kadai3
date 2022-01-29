class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book) , notice: "Book was successfully created."
    else
      @user = current_user
      @books = Book.all
      flash.now[:alert]
      render :index
    end
  end

  def edit
     @book = Book.find(params[:id])
     if @book.user != current_user
       redirect_to books_path
     end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def index
    @user=current_user
    @books= Book.all
    @book = Book.new

  end

  def show
    @new_book = Book.new
    @user = current_user
    @book = Book.find(params[:id])
    @bookid = @book.user
  end

   private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
