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
  end

  def create
    
  end

  def update
    
  end

  def destroy
   
  end

  private

   
end
