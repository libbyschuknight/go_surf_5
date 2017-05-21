class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Lib's Surf Spots #{@user.username}"
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated."
      redirect_to surf_spots_path
    else
      render "edit"
    end
  end

  def show
    @user_surf_spots = @user.surf_spots.paginate(page: params[:page], per_page: 3)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all surf spots created by user have been deleted."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:danger] = "You can only edit or delete your own profile."
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? && !current_user.admin?
      flash[:danger] = "Only admin users can perfom that aciton."
      redirect_to root_path
    end
  end
end
