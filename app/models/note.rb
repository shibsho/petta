class Note < ApplicationRecord
	validates :image, presence:true
	validates :category, presence:true
	validates :content, presence:true
	validates :user_id, presence:true

	belongs_to :user
	has_many :likes
end
