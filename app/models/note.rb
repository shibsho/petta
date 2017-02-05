class Note < ApplicationRecord
	validates :image, presence:true
	validates :category, presence:true
	validates :content, presence:true
end
