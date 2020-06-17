class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all.order("id DESC")
    @book = Book.new
    @user = User.find_by(id: current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @booka = Book.new
    @user = User.find_by(id: @book.user_id)
    #@user = @book.user
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      @user = User.find_by(id: current_user.id)
      @books = Book.all.order("id DESC")
      render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    flash[:notice] = "successfully"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
