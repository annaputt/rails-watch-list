class Movie < ApplicationRecord
  has_many :bookmarks
  has_one :list, through: :bookmarks
  validates :overview, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true 
  # validates :url, :rating, presence: true
end
