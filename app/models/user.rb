class User < ActiveRecord::Base
  has_many :news
  has_many :comments
  has_many :likes
  has_many :decks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable , :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
