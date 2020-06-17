class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users =  User.all.order("id DESC")
    @user = User.find_by(id:current_user.id)
    @book = Book.new
  end

  def show
    @book = Book.new
    # @books = Book.all.order("id DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user)
      else
        render action: :edit
      end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
