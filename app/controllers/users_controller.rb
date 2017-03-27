class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user, only: [ :edit, :update]
  before_action :set_user, only: [ :show, :edit, :update, :notes, :like_notes, :following, :follower ]


  def show
    @notes = @user.notes.order(created_at: :desc)
    @title = "Notes"
    @categories = Category.all
    @following_users = @user.following_users
    @following_notes = Note.where("user_id IN (?) OR user_id = ?", @user.following_users.map(&:id), @user.id).order(created_at: :desc)
  end


  def edit
  end

  def create
  end

  def update
    if  @user.update(user_params)
      redirect_to @user, notice: 'プロフィールが更新されました'
    else
      render :edit
    end
  end

  def following
    @following_users = @user.following_users.order(created_at: :desc)
  end

  def follower
    @followers = @user.followers.order(created_at: :desc)
  end

  def notes
    @notes = @user.notes.order(created_at: :desc)
  end

  def like_notes
    @notes = @user.like_notes.order(created_at: :desc)
    @title = "お気に入り"
    @categories = Category.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :introduction)
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
