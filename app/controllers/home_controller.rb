class HomeController < ApplicationController
  def top
  	@notes = Note.all.order(created_at: :desc)
  	@category = "日常"
  end
 

  def about
  end
end
