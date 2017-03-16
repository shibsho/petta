class HomeController < ApplicationController
  def top
  	@notes = Note.all.order(created_at: :desc)
  	@category = "日常"
  end

 #POST root
  def search
  	redirect_to root_path
  end

 

  def about
  end
end
