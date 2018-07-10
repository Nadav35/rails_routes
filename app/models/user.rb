class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  
  has_many :artworks,
  foreign_key: :artist_id,
  class_name: :Artwork,
  primary_key: :id,
  dependent: :destroy
  
  has_many :artwork_shares,
  foreign_key: :viewer_id,
  class_name: :ArtworkShare,
  primary_key: :id,
  dependent: :destroy
  
  has_many :shared_artworks,
  through: :artwork_shares,
  source: :artwork
  
end