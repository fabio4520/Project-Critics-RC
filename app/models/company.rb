class Company < ApplicationRecord
    has_one_attached :cover
    has_many :involved_companies, dependent: :destroy
    has_many :games, through: :involved_companies
    has_many :critics, as: :criticable, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true, length: {in: 10..250}
    validates :cover, presence: false 
end
