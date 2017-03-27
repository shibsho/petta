class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true

  has_many :notes, dependent: :destroy
  has_many :likes
  has_many :like_notes, through: :likes, source: :note

  has_many :active_relationships, class_name: "Relationship", foreign_key: "from_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "target_id", dependent: :destroy
   #フォローしている対象の集合体
  has_many :following_users, through: :active_relationships, source: :target
   #フォロワーの集合体
  has_many :followers, through: :passive_relationships, source: :from
end
