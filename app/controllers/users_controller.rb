class UsersController < ApplicationController
  def index
    @users =  User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

end
