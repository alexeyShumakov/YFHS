class User < ActiveRecord::Base
  has_many :news
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable , :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
