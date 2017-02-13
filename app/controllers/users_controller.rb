class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user, only:[:edit,:update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @notes = @user.notes
    @title = "の投稿一覧"
    @category_title = ["日常","さんぽ"]
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

  def like_notes
    @user = User.find(params[:id])
    @notes = @user.like_notes
    @title = "のお気に入り一覧"
    render :show
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end

    def correct_user
      user = User.find(params[:id])
      if current_user.id != user.id
        redirect_to root_path
      end
    end
end
