class HomeController < ApplicationController
  def top
  	@notes = Note.all.order(created_at: :desc)
  end

  def about
  end
end
