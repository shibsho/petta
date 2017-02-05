class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    
  end

  def update
     @user = User.find(params[:id])
    if  @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end

  def destroy
   
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
