class HomeController < ApplicationController
  def top
  	@notes = Note.all.order(created_at: :desc)
  	@category = "日常"
  end

 #POST root
  def category
  	@category_title = params[:category]
    @notes = Note.where(category: @category_title).order(created_at: :desc)
  end

 

  def about
  end
end
