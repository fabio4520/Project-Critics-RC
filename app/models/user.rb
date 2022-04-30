class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
  has_one_attached :avatar
  has_many :critics, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: true
  validates :avatar, presence: false 
end
