class HomeController < ApplicationController
  def top
  	@notes = Note.all
  end

  def about
  end
end
