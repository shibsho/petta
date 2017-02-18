class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user, only: [ :edit, :update]
  before_action :set_user, only: [ :show, :edit, :update, :like_notes ]

  def index
    @users = User.all
  end

  def show
    @notes = @user.notes
    @title = "Notes"
    @categories = Category.all
  end


  def edit
  end

  def create
  end

  def update
    if  @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end

  def like_notes
    @notes = @user.like_notes
    @title = "お気に入り"
    @category_title = ["日常","さんぽ"]
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def correct_user
      user = User.find(params[:id])
      if current_user.id != user.id
        redirect_to root_path
      end
    end
end
