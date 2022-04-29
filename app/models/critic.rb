class Critic < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: {in: 10..250 }

  belongs_to :user, counter_cache: true
  belongs_to :criticable, polymorphic: true
end
