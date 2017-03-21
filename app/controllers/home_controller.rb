class HomeController < ApplicationController
  def top
  	@notes = Note.all.order(created_at: :desc)
  	@category = "日常"
  end

 #POST root
  def search
  	@category = params[:category]
    @notes = Note.where(category: @category)
  end

 

  def about
  end
end
