class Artwork < ApplicationRecord
  validates :artist_id, :title, :image_url, presence: true
  validates :artist_id, uniqueness: { scope: :title }
  
  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User,
  primary_key: :id
  
  has_many :shared_artworks,
  foreign_key: :artwork_id,
  class_name: :ArtworkShare,
  primary_key: :id
  
  has_many :shared_viewers,
  through: :shared_artworks,
  source: :viewer
  
  
  
  
  
end