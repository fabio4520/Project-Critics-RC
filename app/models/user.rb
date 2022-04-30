class User < ApplicationRecord
    has_one_attached :avatar
    has_many :critics, dependent: :destroy

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :avatar, presence: false 
end