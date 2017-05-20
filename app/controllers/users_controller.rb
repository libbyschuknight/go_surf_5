class UsersController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Lib's Surf Spots #{@user.username}"
      redirect_to surf_spots_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
