class Game < ApplicationRecord
    has_one_attached :cover
    has_many :critics, as: :criticable, dependent: :destroy
    has_many :involved_companies, dependent: :destroy
    has_many :companies, through: :involved_companies
    has_and_belongs_to_many :platforms
    has_and_belongs_to_many :genres
    has_many :expansions, class_name: "Game", 
                                            foreign_key: "parent_id", 
                                            dependent: :destroy, 
                                            inverse_of: "parent"
    belongs_to :parent, class_name: "Game", optional: true
    
    validates :name, presence: true
    validates :summary, presence: true, length: {in: 10..250}
    validates :category, presence: true
    validates :cover, presence: false 

    enum category: { main_game: 0, expansion: 1}

    has_one_attached :cover
end
